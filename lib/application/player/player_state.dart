part of 'player_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class PlayerState with _$PlayerState {
  const PlayerState._();
  const factory PlayerState({
    @Default(<TrackDto>[]) List<TrackDto> queue,
    @Default(-1) int currentIndex,
    @Default(false) bool isPlaying,
    @Default(ProcessingState.idle) ProcessingState processingState,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default('') String errorMessage,
  }) = _PlayerState;
  factory PlayerState.initial() => const PlayerState();
  TrackDto? get currentTrack => currentIndex >= 0 && currentIndex < queue.length
      ? queue[currentIndex]
      : null;
  bool get hasPrevious => currentIndex > 0;
  bool get hasNext => currentIndex >= 0 && currentIndex < queue.length - 1;
  bool get isLoading =>
      processingState == ProcessingState.loading ||
      processingState == ProcessingState.buffering;
}
