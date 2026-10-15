// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_catalog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MusicCatalogState {

 MusicRepository get musicRepository; CatalogStatus get status; List<TrackDto> get tracks; String get search; bool get hasMore; bool get isLoadingMore; String get errorMessage;
/// Create a copy of MusicCatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicCatalogStateCopyWith<MusicCatalogState> get copyWith => _$MusicCatalogStateCopyWithImpl<MusicCatalogState>(this as MusicCatalogState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MusicCatalogState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicCatalogState&&(identical(other.musicRepository, _this.musicRepository) || other.musicRepository == _this.musicRepository)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.tracks, _this.tracks)&&(identical(other.search, _this.search) || other.search == _this.search)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.isLoadingMore, _this.isLoadingMore) || other.isLoadingMore == _this.isLoadingMore)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as MusicCatalogState;
  return Object.hash(runtimeType,_this.musicRepository,_this.status,const DeepCollectionEquality().hash(_this.tracks),_this.search,_this.hasMore,_this.isLoadingMore,_this.errorMessage);
}

@override
String toString() {
  final _this = this as MusicCatalogState;
  return 'MusicCatalogState(musicRepository: ${_this.musicRepository}, status: ${_this.status}, tracks: ${_this.tracks}, search: ${_this.search}, hasMore: ${_this.hasMore}, isLoadingMore: ${_this.isLoadingMore}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $MusicCatalogStateCopyWith<$Res>  {
  factory $MusicCatalogStateCopyWith(MusicCatalogState value, $Res Function(MusicCatalogState) _then) = _$MusicCatalogStateCopyWithImpl;
@useResult
$Res call({
 MusicRepository musicRepository, CatalogStatus status, List<TrackDto> tracks, String search, bool hasMore, bool isLoadingMore, String errorMessage
});




}
/// @nodoc
class _$MusicCatalogStateCopyWithImpl<$Res>
    implements $MusicCatalogStateCopyWith<$Res> {
  _$MusicCatalogStateCopyWithImpl(this._self, this._then);

  final MusicCatalogState _self;
  final $Res Function(MusicCatalogState) _then;

/// Create a copy of MusicCatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? musicRepository = null,Object? status = null,Object? tracks = null,Object? search = null,Object? hasMore = null,Object? isLoadingMore = null,Object? errorMessage = null,}) {
  return _then(MusicCatalogState(
musicRepository: null == musicRepository ? _self.musicRepository : musicRepository // ignore: cast_nullable_to_non_nullable
as MusicRepository,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CatalogStatus,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<TrackDto>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicCatalogState].
extension MusicCatalogStatePatterns on MusicCatalogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicCatalogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicCatalogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicCatalogState value)  $default,){
final _that = this;
switch (_that) {
case _MusicCatalogState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicCatalogState value)?  $default,){
final _that = this;
switch (_that) {
case _MusicCatalogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MusicRepository musicRepository,  CatalogStatus status,  List<TrackDto> tracks,  String search,  bool hasMore,  bool isLoadingMore,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicCatalogState() when $default != null:
return $default(_that.musicRepository,_that.status,_that.tracks,_that.search,_that.hasMore,_that.isLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MusicRepository musicRepository,  CatalogStatus status,  List<TrackDto> tracks,  String search,  bool hasMore,  bool isLoadingMore,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MusicCatalogState():
return $default(_that.musicRepository,_that.status,_that.tracks,_that.search,_that.hasMore,_that.isLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MusicRepository musicRepository,  CatalogStatus status,  List<TrackDto> tracks,  String search,  bool hasMore,  bool isLoadingMore,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MusicCatalogState() when $default != null:
return $default(_that.musicRepository,_that.status,_that.tracks,_that.search,_that.hasMore,_that.isLoadingMore,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MusicCatalogState implements MusicCatalogState {
  const _MusicCatalogState({required this.musicRepository, this.status = CatalogStatus.initial, this.tracks = const <TrackDto>[], this.search = '', this.hasMore = true, this.isLoadingMore = false, this.errorMessage = ''});
  

@override final  MusicRepository musicRepository;
@override@JsonKey() final  CatalogStatus status;
@override@JsonKey() final  List<TrackDto> tracks;
@override@JsonKey() final  String search;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  String errorMessage;

/// Create a copy of MusicCatalogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicCatalogStateCopyWith<_MusicCatalogState> get copyWith => __$MusicCatalogStateCopyWithImpl<_MusicCatalogState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicCatalogState&&(identical(other.musicRepository, musicRepository) || other.musicRepository == musicRepository)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&(identical(other.search, search) || other.search == search)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,musicRepository,status,const DeepCollectionEquality().hash(tracks),search,hasMore,isLoadingMore,errorMessage);
}

@override
String toString() {
    return 'MusicCatalogState(musicRepository: $musicRepository, status: $status, tracks: $tracks, search: $search, hasMore: $hasMore, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MusicCatalogStateCopyWith<$Res> implements $MusicCatalogStateCopyWith<$Res> {
  factory _$MusicCatalogStateCopyWith(_MusicCatalogState value, $Res Function(_MusicCatalogState) _then) = __$MusicCatalogStateCopyWithImpl;
@override @useResult
$Res call({
 MusicRepository musicRepository, CatalogStatus status, List<TrackDto> tracks, String search, bool hasMore, bool isLoadingMore, String errorMessage
});




}
/// @nodoc
class __$MusicCatalogStateCopyWithImpl<$Res>
    implements _$MusicCatalogStateCopyWith<$Res> {
  __$MusicCatalogStateCopyWithImpl(this._self, this._then);

  final _MusicCatalogState _self;
  final $Res Function(_MusicCatalogState) _then;

/// Create a copy of MusicCatalogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? musicRepository = null,Object? status = null,Object? tracks = null,Object? search = null,Object? hasMore = null,Object? isLoadingMore = null,Object? errorMessage = null,}) {
  return _then(_MusicCatalogState(
musicRepository: null == musicRepository ? _self.musicRepository : musicRepository // ignore: cast_nullable_to_non_nullable
as MusicRepository,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CatalogStatus,tracks: null == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<TrackDto>,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
