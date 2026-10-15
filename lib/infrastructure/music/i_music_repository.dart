import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import '../../domain/music/music_repository.dart';
import '../dto/track_dto/track_dto.dart';

class IMusicRepository implements MusicRepository {
  IMusicRepository(this._client);

  final http.Client _client;

  @override
  Future<TrackPage> fetchTracks({
    required String search,
    required int offset,
    required int limit,
  }) async {
    if (APIConstants.clientId.isEmpty) {
      throw const MusicRepositoryException(
        'JAMENDO_CLIENT_ID is missing. Run the app with '
        '--dart-define-from-file=.env.json.',
      );
    }
    final parameters = <String, String>{
      'client_id': APIConstants.clientId,
      'format': APIConstants.responseFormat,
      'limit': '$limit',
      'offset': '$offset',
      'order': search.trim().isEmpty ? 'popularity_total' : 'relevance',
      'audioformat': APIConstants.audioFormat,
      if (search.trim().isNotEmpty) 'namesearch': search.trim(),
    };
    late final http.Response response;
    try {
      response = await RESTService.performGETRequest(
        httpUrl: APIConstants.tracksUrl,
        client: _client,
        param: parameters,
      );
    } on http.Response catch (errorResponse) {
      throw MusicRepositoryException(
        'Jamendo returned an error (${errorResponse.statusCode}).',
        errorResponse,
      );
    } catch (error) {
      throw MusicRepositoryException(
        'Unable to connect. Check your internet connection and try again.',
        error,
      );
    }
    try {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final headers = body['headers'] as Map<String, dynamic>?;
      if (headers?['status'] != null && headers?['status'] != 'success') {
        throw MusicRepositoryException(
          headers?['error_message']?.toString() ?? 'Jamendo request failed.',
        );
      }
      final results = body['results'] as List<dynamic>? ?? const [];
      final tracks = results
          .whereType<Map<String, dynamic>>()
          .map(TrackDto.fromJson)
          .where((track) => track.id.isNotEmpty && track.audioUrl.isNotEmpty)
          .toList(growable: false);
      return TrackPage(tracks: tracks, hasMore: results.length == limit);
    } on MusicRepositoryException {
      rethrow;
    } catch (error) {
      throw MusicRepositoryException(
        'Jamendo sent an invalid response.',
        error,
      );
    }
  }

  @override
  void dispose() => _client.close();
}

class MusicRepositoryException implements Exception {
  const MusicRepositoryException(this.message, [this.cause]);
  final String message;
  final Object? cause;
  @override
  String toString() => message;
}
