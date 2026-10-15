import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_dto.freezed.dart';
part 'track_dto.g.dart';

@freezed
abstract class TrackDto with _$TrackDto {
  const factory TrackDto({
    @Default('') String id,
    @JsonKey(name: 'name') @Default('Untitled track') String title,
    @JsonKey(name: 'artist_name') @Default('Unknown artist') String artist,
    @JsonKey(name: 'album_name') @Default('Single') String album,
    @JsonKey(name: 'image') @Default('') String artworkUrl,
    @JsonKey(name: 'audio') @Default('') String audioUrl,
    @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)
    @Default(Duration.zero) Duration duration,
  }) = _TrackDto;

  factory TrackDto.fromJson(Map<String, dynamic> json) =>
      _$TrackDtoFromJson(json);
}

Duration _durationFromJson(Object? value) =>
    Duration(seconds: int.tryParse('$value') ?? 0);

int _durationToJson(Duration value) => value.inSeconds;
