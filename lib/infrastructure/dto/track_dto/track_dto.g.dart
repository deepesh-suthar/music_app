// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackDto _$TrackDtoFromJson(Map<String, dynamic> json) => _TrackDto(
  id: json['id'] as String? ?? '',
  title: json['name'] as String? ?? 'Untitled track',
  artist: json['artist_name'] as String? ?? 'Unknown artist',
  album: json['album_name'] as String? ?? 'Single',
  artworkUrl: json['image'] as String? ?? '',
  audioUrl: json['audio'] as String? ?? '',
  duration: json['duration'] == null
      ? Duration.zero
      : _durationFromJson(json['duration']),
);

Map<String, dynamic> _$TrackDtoToJson(_TrackDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.title,
  'artist_name': instance.artist,
  'album_name': instance.album,
  'image': instance.artworkUrl,
  'audio': instance.audioUrl,
  'duration': _durationToJson(instance.duration),
};
