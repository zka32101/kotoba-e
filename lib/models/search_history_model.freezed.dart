// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchHistoryModel {

 String get searchHistoryId; String get userId; String get wordId; String get wordName; DateTime get searchedAt; DateTime get nextReviewDate; int get reviewCount; String get difficulty; DateTime? get lastReviewedAt;
/// Create a copy of SearchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchHistoryModelCopyWith<SearchHistoryModel> get copyWith => _$SearchHistoryModelCopyWithImpl<SearchHistoryModel>(this as SearchHistoryModel, _$identity);

  /// Serializes this SearchHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SearchHistoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchHistoryModel&&(identical(other.searchHistoryId, _this.searchHistoryId) || other.searchHistoryId == _this.searchHistoryId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.wordId, _this.wordId) || other.wordId == _this.wordId)&&(identical(other.wordName, _this.wordName) || other.wordName == _this.wordName)&&(identical(other.searchedAt, _this.searchedAt) || other.searchedAt == _this.searchedAt)&&(identical(other.nextReviewDate, _this.nextReviewDate) || other.nextReviewDate == _this.nextReviewDate)&&(identical(other.reviewCount, _this.reviewCount) || other.reviewCount == _this.reviewCount)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.lastReviewedAt, _this.lastReviewedAt) || other.lastReviewedAt == _this.lastReviewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SearchHistoryModel;
  return Object.hash(runtimeType,_this.searchHistoryId,_this.userId,_this.wordId,_this.wordName,_this.searchedAt,_this.nextReviewDate,_this.reviewCount,_this.difficulty,_this.lastReviewedAt);
}

@override
String toString() {
  final _this = this as SearchHistoryModel;
  return 'SearchHistoryModel(searchHistoryId: ${_this.searchHistoryId}, userId: ${_this.userId}, wordId: ${_this.wordId}, wordName: ${_this.wordName}, searchedAt: ${_this.searchedAt}, nextReviewDate: ${_this.nextReviewDate}, reviewCount: ${_this.reviewCount}, difficulty: ${_this.difficulty}, lastReviewedAt: ${_this.lastReviewedAt})';
}


}

/// @nodoc
abstract mixin class $SearchHistoryModelCopyWith<$Res>  {
  factory $SearchHistoryModelCopyWith(SearchHistoryModel value, $Res Function(SearchHistoryModel) _then) = _$SearchHistoryModelCopyWithImpl;
@useResult
$Res call({
 String searchHistoryId, String userId, String wordId, String wordName, DateTime searchedAt, DateTime nextReviewDate, int reviewCount, String difficulty, DateTime? lastReviewedAt
});




}
/// @nodoc
class _$SearchHistoryModelCopyWithImpl<$Res>
    implements $SearchHistoryModelCopyWith<$Res> {
  _$SearchHistoryModelCopyWithImpl(this._self, this._then);

  final SearchHistoryModel _self;
  final $Res Function(SearchHistoryModel) _then;

/// Create a copy of SearchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchHistoryId = null,Object? userId = null,Object? wordId = null,Object? wordName = null,Object? searchedAt = null,Object? nextReviewDate = null,Object? reviewCount = null,Object? difficulty = null,Object? lastReviewedAt = freezed,}) {
  return _then(SearchHistoryModel(
searchHistoryId: null == searchHistoryId ? _self.searchHistoryId : searchHistoryId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,searchedAt: null == searchedAt ? _self.searchedAt : searchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextReviewDate: null == nextReviewDate ? _self.nextReviewDate : nextReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,lastReviewedAt: freezed == lastReviewedAt ? _self.lastReviewedAt : lastReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchHistoryModel].
extension SearchHistoryModelPatterns on SearchHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchHistoryId,  String userId,  String wordId,  String wordName,  DateTime searchedAt,  DateTime nextReviewDate,  int reviewCount,  String difficulty,  DateTime? lastReviewedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchHistoryModel() when $default != null:
return $default(_that.searchHistoryId,_that.userId,_that.wordId,_that.wordName,_that.searchedAt,_that.nextReviewDate,_that.reviewCount,_that.difficulty,_that.lastReviewedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchHistoryId,  String userId,  String wordId,  String wordName,  DateTime searchedAt,  DateTime nextReviewDate,  int reviewCount,  String difficulty,  DateTime? lastReviewedAt)  $default,) {final _that = this;
switch (_that) {
case _SearchHistoryModel():
return $default(_that.searchHistoryId,_that.userId,_that.wordId,_that.wordName,_that.searchedAt,_that.nextReviewDate,_that.reviewCount,_that.difficulty,_that.lastReviewedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchHistoryId,  String userId,  String wordId,  String wordName,  DateTime searchedAt,  DateTime nextReviewDate,  int reviewCount,  String difficulty,  DateTime? lastReviewedAt)?  $default,) {final _that = this;
switch (_that) {
case _SearchHistoryModel() when $default != null:
return $default(_that.searchHistoryId,_that.userId,_that.wordId,_that.wordName,_that.searchedAt,_that.nextReviewDate,_that.reviewCount,_that.difficulty,_that.lastReviewedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchHistoryModel implements SearchHistoryModel {
  const _SearchHistoryModel({required this.searchHistoryId, required this.userId, required this.wordId, required this.wordName, required this.searchedAt, required this.nextReviewDate, this.reviewCount = 0, this.difficulty = 'normal', this.lastReviewedAt});
  factory _SearchHistoryModel.fromJson(Map<String, dynamic> json) => _$SearchHistoryModelFromJson(json);

@override final  String searchHistoryId;
@override final  String userId;
@override final  String wordId;
@override final  String wordName;
@override final  DateTime searchedAt;
@override final  DateTime nextReviewDate;
@override@JsonKey() final  int reviewCount;
@override@JsonKey() final  String difficulty;
@override final  DateTime? lastReviewedAt;

/// Create a copy of SearchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchHistoryModelCopyWith<_SearchHistoryModel> get copyWith => __$SearchHistoryModelCopyWithImpl<_SearchHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchHistoryModel&&(identical(other.searchHistoryId, searchHistoryId) || other.searchHistoryId == searchHistoryId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.wordId, wordId) || other.wordId == wordId)&&(identical(other.wordName, wordName) || other.wordName == wordName)&&(identical(other.searchedAt, searchedAt) || other.searchedAt == searchedAt)&&(identical(other.nextReviewDate, nextReviewDate) || other.nextReviewDate == nextReviewDate)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.lastReviewedAt, lastReviewedAt) || other.lastReviewedAt == lastReviewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,searchHistoryId,userId,wordId,wordName,searchedAt,nextReviewDate,reviewCount,difficulty,lastReviewedAt);
}

@override
String toString() {
    return 'SearchHistoryModel(searchHistoryId: $searchHistoryId, userId: $userId, wordId: $wordId, wordName: $wordName, searchedAt: $searchedAt, nextReviewDate: $nextReviewDate, reviewCount: $reviewCount, difficulty: $difficulty, lastReviewedAt: $lastReviewedAt)';
}


}

/// @nodoc
abstract mixin class _$SearchHistoryModelCopyWith<$Res> implements $SearchHistoryModelCopyWith<$Res> {
  factory _$SearchHistoryModelCopyWith(_SearchHistoryModel value, $Res Function(_SearchHistoryModel) _then) = __$SearchHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String searchHistoryId, String userId, String wordId, String wordName, DateTime searchedAt, DateTime nextReviewDate, int reviewCount, String difficulty, DateTime? lastReviewedAt
});




}
/// @nodoc
class __$SearchHistoryModelCopyWithImpl<$Res>
    implements _$SearchHistoryModelCopyWith<$Res> {
  __$SearchHistoryModelCopyWithImpl(this._self, this._then);

  final _SearchHistoryModel _self;
  final $Res Function(_SearchHistoryModel) _then;

/// Create a copy of SearchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchHistoryId = null,Object? userId = null,Object? wordId = null,Object? wordName = null,Object? searchedAt = null,Object? nextReviewDate = null,Object? reviewCount = null,Object? difficulty = null,Object? lastReviewedAt = freezed,}) {
  return _then(_SearchHistoryModel(
searchHistoryId: null == searchHistoryId ? _self.searchHistoryId : searchHistoryId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,wordId: null == wordId ? _self.wordId : wordId // ignore: cast_nullable_to_non_nullable
as String,wordName: null == wordName ? _self.wordName : wordName // ignore: cast_nullable_to_non_nullable
as String,searchedAt: null == searchedAt ? _self.searchedAt : searchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextReviewDate: null == nextReviewDate ? _self.nextReviewDate : nextReviewDate // ignore: cast_nullable_to_non_nullable
as DateTime,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,lastReviewedAt: freezed == lastReviewedAt ? _self.lastReviewedAt : lastReviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
