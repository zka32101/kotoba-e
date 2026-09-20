// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkModel {

 String get bookmarkId; String get userId; String get wordId; String get wordName; DateTime get bookmarkedAt; DateTime? get reviewedAt; String get status;
/// Create a copy of BookmarkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkModelCopyWith<BookmarkModel> get copyWith => _$BookmarkModelCopyWithImpl<BookmarkModel>(this as BookmarkModel, _$identity);

  /// Serializes this BookmarkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookmarkModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkModel&&(identical(other.bookmarkId, _this.bookmarkId) || other.bookmarkId == _this.bookmarkId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.wordId, _this.wordId) || other.wordId == _this.wordId)&&(identical(other.wordName, _this.wordName) || other.wordName == _this.wordName)&&(identical(other.bookmarkedAt, _this.bookmarkedAt) || other.bookmarkedAt == _this.bookmarkedAt)&&(identical(other.reviewedAt, _this.reviewedAt) || other.reviewedAt == _this.reviewedAt)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookmarkModel;
  return Object.hash(runtimeType,_this.bookmarkId,_this.userId,_this.wordId,_this.wordName,_this.bookmarkedAt,_this.reviewedAt,_this.status);
}

@override
String toString() {
  final _this = this as BookmarkModel;
  return 'BookmarkModel(bookmarkId: ${_this.bookmarkId}, userId: ${_this.userId}, wordId: ${_this.wordId}, wordName: ${_this.wordName}, bookmarkedAt: ${_this.bookmarkedAt}, reviewedAt: ${_this.reviewedAt}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $BookmarkModelCopyWith<$Res>  {
  factory $BookmarkModelCopyWith(BookmarkModel value, $Res Function(BookmarkModel) _then) = _$BookmarkModelCopyWithImpl;
@useResult
$Res call({
 String bookmarkId, String userId, String wordId, String wordName, DateTime bookmarkedAt, DateTime? reviewedAt, String status
});




}
/// @nodoc
class _$BookmarkModelCopyWithImpl<$Res>
    implements $BookmarkModelCopyWith<$Res> {
  _$BookmarkModelCopyWithImpl(this._self, this._then);

  final BookmarkModel _self;
  final $Res Function(BookmarkModel) _then;

/// Create a copy of BookmarkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookmarkId = null,Object? userId = null,Object? wordId = null,Object? wordName = null,Object? bookmarkedAt = null,Object? reviewedAt = freezed,Object? status = null,}) {
  return _then(BookmarkModel(
bookmarkId: null == bookmarkId ? _self.bookmarkId : bookmarkId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,bookmarkedAt: null == bookmarkedAt ? _self.bookmarkedAt : bookmarkedAt // ignore: cast_nullable_to_non_nullable
as DateTime,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookmarkModel].
extension BookmarkModelPatterns on BookmarkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookmarkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookmarkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookmarkModel value)  $default,){
final _that = this;
switch (_that) {
case _BookmarkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookmarkModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookmarkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String bookmarkId,  String userId,  String wordId,  String wordName,  DateTime bookmarkedAt,  DateTime? reviewedAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookmarkModel() when $default != null:
return $default(_that.bookmarkId,_that.userId,_that.wordId,_that.wordName,_that.bookmarkedAt,_that.reviewedAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String bookmarkId,  String userId,  String wordId,  String wordName,  DateTime bookmarkedAt,  DateTime? reviewedAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _BookmarkModel():
return $default(_that.bookmarkId,_that.userId,_that.wordId,_that.wordName,_that.bookmarkedAt,_that.reviewedAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String bookmarkId,  String userId,  String wordId,  String wordName,  DateTime bookmarkedAt,  DateTime? reviewedAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _BookmarkModel() when $default != null:
return $default(_that.bookmarkId,_that.userId,_that.wordId,_that.wordName,_that.bookmarkedAt,_that.reviewedAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookmarkModel implements BookmarkModel {
  const _BookmarkModel({required this.bookmarkId, required this.userId, required this.wordId, required this.wordName, required this.bookmarkedAt, this.reviewedAt, this.status = 'new'});
  factory _BookmarkModel.fromJson(Map<String, dynamic> json) => _$BookmarkModelFromJson(json);

@override final  String bookmarkId;
@override final  String userId;
@override final  String wordId;
@override final  String wordName;
@override final  DateTime bookmarkedAt;
@override final  DateTime? reviewedAt;
@override@JsonKey() final  String status;

/// Create a copy of BookmarkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkModelCopyWith<_BookmarkModel> get copyWith => __$BookmarkModelCopyWithImpl<_BookmarkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkModel&&(identical(other.bookmarkId, bookmarkId) || other.bookmarkId == bookmarkId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.wordId, wordId) || other.wordId == wordId)&&(identical(other.wordName, wordName) || other.wordName == wordName)&&(identical(other.bookmarkedAt, bookmarkedAt) || other.bookmarkedAt == bookmarkedAt)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bookmarkId,userId,wordId,wordName,bookmarkedAt,reviewedAt,status);
}

@override
String toString() {
    return 'BookmarkModel(bookmarkId: $bookmarkId, userId: $userId, wordId: $wordId, wordName: $wordName, bookmarkedAt: $bookmarkedAt, reviewedAt: $reviewedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$BookmarkModelCopyWith<$Res> implements $BookmarkModelCopyWith<$Res> {
  factory _$BookmarkModelCopyWith(_BookmarkModel value, $Res Function(_BookmarkModel) _then) = __$BookmarkModelCopyWithImpl;
@override @useResult
$Res call({
 String bookmarkId, String userId, String wordId, String wordName, DateTime bookmarkedAt, DateTime? reviewedAt, String status
});




}
/// @nodoc
class __$BookmarkModelCopyWithImpl<$Res>
    implements _$BookmarkModelCopyWith<$Res> {
  __$BookmarkModelCopyWithImpl(this._self, this._then);

  final _BookmarkModel _self;
  final $Res Function(_BookmarkModel) _then;

/// Create a copy of BookmarkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookmarkId = null,Object? userId = null,Object? wordId = null,Object? wordName = null,Object? bookmarkedAt = null,Object? reviewedAt = freezed,Object? status = null,}) {
  return _then(_BookmarkModel(
bookmarkId: null == bookmarkId ? _self.bookmarkId : bookmarkId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,bookmarkedAt: null == bookmarkedAt ? _self.bookmarkedAt : bookmarkedAt // ignore: cast_nullable_to_non_nullable
as DateTime,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
