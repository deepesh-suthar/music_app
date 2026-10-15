// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackDto {

 String get id;@JsonKey(name: 'name') String get title;@JsonKey(name: 'artist_name') String get artist;@JsonKey(name: 'album_name') String get album;@JsonKey(name: 'image') String get artworkUrl;@JsonKey(name: 'audio') String get audioUrl;@JsonKey(fromJson: _durationFromJson, toJson: _durationToJson) Duration get duration;
/// Create a copy of TrackDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackDtoCopyWith<TrackDto> get copyWith => _$TrackDtoCopyWithImpl<TrackDto>(this as TrackDto, _$identity);

  /// Serializes this TrackDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrackDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.artist, _this.artist) || other.artist == _this.artist)&&(identical(other.album, _this.album) || other.album == _this.album)&&(identical(other.artworkUrl, _this.artworkUrl) || other.artworkUrl == _this.artworkUrl)&&(identical(other.audioUrl, _this.audioUrl) || other.audioUrl == _this.audioUrl)&&(identical(other.duration, _this.duration) || other.duration == _this.duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrackDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.artist,_this.album,_this.artworkUrl,_this.audioUrl,_this.duration);
}

@override
String toString() {
  final _this = this as TrackDto;
  return 'TrackDto(id: ${_this.id}, title: ${_this.title}, artist: ${_this.artist}, album: ${_this.album}, artworkUrl: ${_this.artworkUrl}, audioUrl: ${_this.audioUrl}, duration: ${_this.duration})';
}


}

/// @nodoc
abstract mixin class $TrackDtoCopyWith<$Res>  {
  factory $TrackDtoCopyWith(TrackDto value, $Res Function(TrackDto) _then) = _$TrackDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'name') String title,@JsonKey(name: 'artist_name') String artist,@JsonKey(name: 'album_name') String album,@JsonKey(name: 'image') String artworkUrl,@JsonKey(name: 'audio') String audioUrl,@JsonKey(fromJson: _durationFromJson, toJson: _durationToJson) Duration duration
});




}
/// @nodoc
class _$TrackDtoCopyWithImpl<$Res>
    implements $TrackDtoCopyWith<$Res> {
  _$TrackDtoCopyWithImpl(this._self, this._then);

  final TrackDto _self;
  final $Res Function(TrackDto) _then;

/// Create a copy of TrackDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? album = null,Object? artworkUrl = null,Object? audioUrl = null,Object? duration = null,}) {
  return _then(TrackDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,artworkUrl: null == artworkUrl ? _self.artworkUrl : artworkUrl // ignore: cast_nullable_to_non_nullable
as String,audioUrl: null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackDto].
extension TrackDtoPatterns on TrackDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackDto value)  $default,){
final _that = this;
switch (_that) {
case _TrackDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrackDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'name')  String title, @JsonKey(name: 'artist_name')  String artist, @JsonKey(name: 'album_name')  String album, @JsonKey(name: 'image')  String artworkUrl, @JsonKey(name: 'audio')  String audioUrl, @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackDto() when $default != null:
return $default(_that.id,_that.title,_that.artist,_that.album,_that.artworkUrl,_that.audioUrl,_that.duration);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'name')  String title, @JsonKey(name: 'artist_name')  String artist, @JsonKey(name: 'album_name')  String album, @JsonKey(name: 'image')  String artworkUrl, @JsonKey(name: 'audio')  String audioUrl, @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _TrackDto():
return $default(_that.id,_that.title,_that.artist,_that.album,_that.artworkUrl,_that.audioUrl,_that.duration);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'name')  String title, @JsonKey(name: 'artist_name')  String artist, @JsonKey(name: 'album_name')  String album, @JsonKey(name: 'image')  String artworkUrl, @JsonKey(name: 'audio')  String audioUrl, @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson)  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _TrackDto() when $default != null:
return $default(_that.id,_that.title,_that.artist,_that.album,_that.artworkUrl,_that.audioUrl,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackDto implements TrackDto {
  const _TrackDto({this.id = '', @JsonKey(name: 'name') this.title = 'Untitled track', @JsonKey(name: 'artist_name') this.artist = 'Unknown artist', @JsonKey(name: 'album_name') this.album = 'Single', @JsonKey(name: 'image') this.artworkUrl = '', @JsonKey(name: 'audio') this.audioUrl = '', @JsonKey(fromJson: _durationFromJson, toJson: _durationToJson) this.duration = Duration.zero});
  factory _TrackDto.fromJson(Map<String, dynamic> json) => _$TrackDtoFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey(name: 'name') final  String title;
@override@JsonKey(name: 'artist_name') final  String artist;
@override@JsonKey(name: 'album_name') final  String album;
@override@JsonKey(name: 'image') final  String artworkUrl;
@override@JsonKey(name: 'audio') final  String audioUrl;
@override@JsonKey(fromJson: _durationFromJson, toJson: _durationToJson) final  Duration duration;

/// Create a copy of TrackDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackDtoCopyWith<_TrackDto> get copyWith => __$TrackDtoCopyWithImpl<_TrackDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.album, album) || other.album == album)&&(identical(other.artworkUrl, artworkUrl) || other.artworkUrl == artworkUrl)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,artist,album,artworkUrl,audioUrl,duration);
}

@override
String toString() {
    return 'TrackDto(id: $id, title: $title, artist: $artist, album: $album, artworkUrl: $artworkUrl, audioUrl: $audioUrl, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$TrackDtoCopyWith<$Res> implements $TrackDtoCopyWith<$Res> {
  factory _$TrackDtoCopyWith(_TrackDto value, $Res Function(_TrackDto) _then) = __$TrackDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'name') String title,@JsonKey(name: 'artist_name') String artist,@JsonKey(name: 'album_name') String album,@JsonKey(name: 'image') String artworkUrl,@JsonKey(name: 'audio') String audioUrl,@JsonKey(fromJson: _durationFromJson, toJson: _durationToJson) Duration duration
});




}
/// @nodoc
class __$TrackDtoCopyWithImpl<$Res>
    implements _$TrackDtoCopyWith<$Res> {
  __$TrackDtoCopyWithImpl(this._self, this._then);

  final _TrackDto _self;
  final $Res Function(_TrackDto) _then;

/// Create a copy of TrackDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? album = null,Object? artworkUrl = null,Object? audioUrl = null,Object? duration = null,}) {
  return _then(_TrackDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,album: null == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String,artworkUrl: null == artworkUrl ? _self.artworkUrl : artworkUrl // ignore: cast_nullable_to_non_nullable
as String,audioUrl: null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
