part of 'music_catalog_cubit.dart';

enum CatalogStatus { initial, loading, success, failure }

@Freezed(makeCollectionsUnmodifiable: false)
abstract class MusicCatalogState with _$MusicCatalogState {
  const factory MusicCatalogState({
    required MusicRepository musicRepository,
    @Default(CatalogStatus.initial) CatalogStatus status,
    @Default(<TrackDto>[]) List<TrackDto> tracks,
    @Default('') String search,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
    @Default('') String errorMessage,
  }) = _MusicCatalogState;
  factory MusicCatalogState.initial({MusicRepository? musicRepository}) =>
      MusicCatalogState(
        musicRepository: musicRepository ?? IMusicRepository(http.Client()),
      );
}
