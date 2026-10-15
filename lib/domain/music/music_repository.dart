import '../../infrastructure/dto/track_dto/track_dto.dart';

class TrackPage {
  const TrackPage({required this.tracks, required this.hasMore});

  final List<TrackDto> tracks;
  final bool hasMore;
}

abstract interface class MusicRepository {
  Future<TrackPage> fetchTracks({
    required String search,
    required int offset,
    required int limit,
  });

  void dispose();
}
