import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart' hide PlayerState;

import '../../domain/core/safe_cubit.dart';
import '../../infrastructure/dto/track_dto/track_dto.dart';
part 'player_cubit.freezed.dart';
part 'player_state.dart';

class PlayerCubit extends SafeCubit<PlayerState> {
  PlayerCubit(super.initialState, {AudioPlayer? audioPlayer})
    : _player = audioPlayer ?? AudioPlayer() {
    _subscriptions.add(_player.playbackEventStream.listen(_handlePlayerState));
    _subscriptions.add(
      _player.positionStream.listen((position) {
        if (!isClosed) emit(state.copyWith(position: position));
      }),
    );
    _subscriptions.add(
      _player.durationStream.listen((duration) {
        if (!isClosed) {
          emit(state.copyWith(duration: duration ?? Duration.zero));
        }
      }),
    );
    _subscriptions.add(
      _player.errorStream.listen((error) {
        if (!isClosed) {
          emit(
            state.copyWith(
              isPlaying: false,
              errorMessage: error.message ?? 'Unable to play this track.',
            ),
          );
        }
      }),
    );
  }
  final AudioPlayer _player;
  final List<StreamSubscription<dynamic>> _subscriptions = [];
  bool _movingToNext = false;

  Future<void> playTrack(TrackDto track, List<TrackDto> queue) async {
    final index = queue.indexWhere((item) => item.id == track.id);
    emit(
      state.copyWith(
        queue: List<TrackDto>.of(queue),
        currentIndex: index < 0 ? 0 : index,
        position: Duration.zero,
        duration: track.duration,
        errorMessage: '',
        processingState: ProcessingState.loading,
      ),
    );
    await _loadCurrentTrack();
  }

  Future<void> _loadCurrentTrack() async {
    final track = state.currentTrack;
    if (track == null || track.audioUrl.isEmpty) {
      emit(state.copyWith(errorMessage: 'This track has no playable audio.'));
      return;
    }
    try {
      await _player.setUrl(track.audioUrl);
      await _player.play();
    } catch (_) {
      emit(
        state.copyWith(
          isPlaying: false,
          processingState: ProcessingState.idle,
          errorMessage: 'Unable to play ${track.title}.',
        ),
      );
    }
  }

  Future<void> togglePlayPause() async {
    if (state.currentTrack == null) return;
    _player.playing ? await _player.pause() : await _player.play();
  }

  Future<void> seek(Duration position) => _player.seek(position);

  void clearError() {
    if (state.errorMessage.isNotEmpty) {
      emit(state.copyWith(errorMessage: ''));
    }
  }

  Future<void> next() async {
    if (!state.hasNext || _movingToNext) return;
    _movingToNext = true;
    emit(
      state.copyWith(
        currentIndex: state.currentIndex + 1,
        position: Duration.zero,
        errorMessage: '',
      ),
    );
    await _loadCurrentTrack();
    _movingToNext = false;
  }

  Future<void> previous() async {
    if (state.position > const Duration(seconds: 3)) {
      await seek(Duration.zero);
      return;
    }
    if (!state.hasPrevious) return;
    emit(
      state.copyWith(
        currentIndex: state.currentIndex - 1,
        position: Duration.zero,
        errorMessage: '',
      ),
    );
    await _loadCurrentTrack();
  }

  void _handlePlayerState(PlaybackEvent _) {
    if (isClosed) return;
    emit(
      state.copyWith(
        isPlaying: _player.playing,
        processingState: _player.processingState,
      ),
    );
    if (_player.processingState == ProcessingState.completed) {
      state.hasNext ? unawaited(next()) : unawaited(seek(Duration.zero));
    }
  }

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    await _player.dispose();
    return super.close();
  }
}
