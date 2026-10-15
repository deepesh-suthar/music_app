import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

import '../../domain/core/app_constants.dart';
import '../../domain/core/safe_cubit.dart';
import '../../domain/music/music_repository.dart';
import '../../infrastructure/dto/track_dto/track_dto.dart';
import '../../infrastructure/music/i_music_repository.dart';
part 'music_catalog_cubit.freezed.dart';
part 'music_catalog_state.dart';

class MusicCatalogCubit extends SafeCubit<MusicCatalogState> {
  MusicCatalogCubit(super.initialState);
  Timer? _searchDebounce;
  bool _requestInProgress = false;
  int _requestVersion = 0;

  void onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(
      const Duration(milliseconds: 450),
      () => search(value),
    );
  }

  Future<void> loadInitial() => search(state.search);
  Future<void> search(String value) async {
    _searchDebounce?.cancel();
    final query = value.trim();
    final version = ++_requestVersion;
    _requestInProgress = true;
    emit(state.copyWith(status: CatalogStatus.loading, search: query));
    try {
      final page = await state.musicRepository.fetchTracks(
        search: query,
        offset: 0,
        limit: AppConstants.pageSize,
      );
      if (version != _requestVersion) return;
      emit(
        state.copyWith(
          status: CatalogStatus.success,
          tracks: page.tracks,
          search: query,
          hasMore: page.hasMore,
          errorMessage: '',
        ),
      );
    } catch (error) {
      if (version != _requestVersion) return;
      emit(
        state.copyWith(
          status: CatalogStatus.failure,
          tracks: const [],
          search: query,
          errorMessage: error.toString(),
        ),
      );
    } finally {
      if (version == _requestVersion) _requestInProgress = false;
    }
  }

  Future<void> loadMore() async {
    if (_requestInProgress || !state.hasMore || state.tracks.isEmpty) return;
    final version = _requestVersion;
    _requestInProgress = true;
    emit(state.copyWith(isLoadingMore: true, errorMessage: ''));
    try {
      final page = await state.musicRepository.fetchTracks(
        search: state.search,
        offset: state.tracks.length,
        limit: AppConstants.pageSize,
      );
      if (version != _requestVersion) return;
      final tracks = {for (final track in state.tracks) track.id: track};
      for (final track in page.tracks) {
        tracks[track.id] = track;
      }
      emit(
        state.copyWith(
          tracks: tracks.values.toList(growable: false),
          hasMore: page.hasMore,
          isLoadingMore: false,
        ),
      );
    } catch (error) {
      if (version != _requestVersion) return;
      emit(
        state.copyWith(isLoadingMore: false, errorMessage: error.toString()),
      );
    } finally {
      if (version == _requestVersion) _requestInProgress = false;
    }
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    state.musicRepository.dispose();
    return super.close();
  }
}
