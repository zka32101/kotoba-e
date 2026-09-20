// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AchievementModel {

 String get achievementId; String get achievementType; String get description; String? get iconUrl;
/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementModelCopyWith<AchievementModel> get copyWith => _$AchievementModelCopyWithImpl<AchievementModel>(this as AchievementModel, _$identity);

  /// Serializes this AchievementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AchievementModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementModel&&(identical(other.achievementId, _this.achievementId) || other.achievementId == _this.achievementId)&&(identical(other.achievementType, _this.achievementType) || other.achievementType == _this.achievementType)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.iconUrl, _this.iconUrl) || other.iconUrl == _this.iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AchievementModel;
  return Object.hash(runtimeType,_this.achievementId,_this.achievementType,_this.description,_this.iconUrl);
}

@override
String toString() {
  final _this = this as AchievementModel;
  return 'AchievementModel(achievementId: ${_this.achievementId}, achievementType: ${_this.achievementType}, description: ${_this.description}, iconUrl: ${_this.iconUrl})';
}


}

/// @nodoc
abstract mixin class $AchievementModelCopyWith<$Res>  {
  factory $AchievementModelCopyWith(AchievementModel value, $Res Function(AchievementModel) _then) = _$AchievementModelCopyWithImpl;
@useResult
$Res call({
 String achievementId, String achievementType, String description, String? iconUrl
});




}
/// @nodoc
class _$AchievementModelCopyWithImpl<$Res>
    implements $AchievementModelCopyWith<$Res> {
  _$AchievementModelCopyWithImpl(this._self, this._then);

  final AchievementModel _self;
  final $Res Function(AchievementModel) _then;

/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? achievementId = null,Object? achievementType = null,Object? description = null,Object? iconUrl = freezed,}) {
  return _then(AchievementModel(
achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as String,achievementType: null == achievementType ? _self.achievementType : achievementType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementModel].
extension AchievementModelPatterns on AchievementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementModel value)  $default,){
final _that = this;
switch (_that) {
case _AchievementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementModel value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String achievementId,  String achievementType,  String description,  String? iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementModel() when $default != null:
return $default(_that.achievementId,_that.achievementType,_that.description,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String achievementId,  String achievementType,  String description,  String? iconUrl)  $default,) {final _that = this;
switch (_that) {
case _AchievementModel():
return $default(_that.achievementId,_that.achievementType,_that.description,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String achievementId,  String achievementType,  String description,  String? iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _AchievementModel() when $default != null:
return $default(_that.achievementId,_that.achievementType,_that.description,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AchievementModel implements AchievementModel {
  const _AchievementModel({required this.achievementId, this.achievementType = 'streak_7days', required this.description, this.iconUrl});
  factory _AchievementModel.fromJson(Map<String, dynamic> json) => _$AchievementModelFromJson(json);

@override final  String achievementId;
@override@JsonKey() final  String achievementType;
@override final  String description;
@override final  String? iconUrl;

/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementModelCopyWith<_AchievementModel> get copyWith => __$AchievementModelCopyWithImpl<_AchievementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementModel&&(identical(other.achievementId, achievementId) || other.achievementId == achievementId)&&(identical(other.achievementType, achievementType) || other.achievementType == achievementType)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,achievementId,achievementType,description,iconUrl);
}

@override
String toString() {
    return 'AchievementModel(achievementId: $achievementId, achievementType: $achievementType, description: $description, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$AchievementModelCopyWith<$Res> implements $AchievementModelCopyWith<$Res> {
  factory _$AchievementModelCopyWith(_AchievementModel value, $Res Function(_AchievementModel) _then) = __$AchievementModelCopyWithImpl;
@override @useResult
$Res call({
 String achievementId, String achievementType, String description, String? iconUrl
});




}
/// @nodoc
class __$AchievementModelCopyWithImpl<$Res>
    implements _$AchievementModelCopyWith<$Res> {
  __$AchievementModelCopyWithImpl(this._self, this._then);

  final _AchievementModel _self;
  final $Res Function(_AchievementModel) _then;

/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? achievementId = null,Object? achievementType = null,Object? description = null,Object? iconUrl = freezed,}) {
  return _then(_AchievementModel(
achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as String,achievementType: null == achievementType ? _self.achievementType : achievementType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserAchievementModel {

 String get userAchievementId; String get userId; String get achievementId; DateTime get unlockedAt; bool get notified;
/// Create a copy of UserAchievementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAchievementModelCopyWith<UserAchievementModel> get copyWith => _$UserAchievementModelCopyWithImpl<UserAchievementModel>(this as UserAchievementModel, _$identity);

  /// Serializes this UserAchievementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserAchievementModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAchievementModel&&(identical(other.userAchievementId, _this.userAchievementId) || other.userAchievementId == _this.userAchievementId)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.achievementId, _this.achievementId) || other.achievementId == _this.achievementId)&&(identical(other.unlockedAt, _this.unlockedAt) || other.unlockedAt == _this.unlockedAt)&&(identical(other.notified, _this.notified) || other.notified == _this.notified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserAchievementModel;
  return Object.hash(runtimeType,_this.userAchievementId,_this.userId,_this.achievementId,_this.unlockedAt,_this.notified);
}

@override
String toString() {
  final _this = this as UserAchievementModel;
  return 'UserAchievementModel(userAchievementId: ${_this.userAchievementId}, userId: ${_this.userId}, achievementId: ${_this.achievementId}, unlockedAt: ${_this.unlockedAt}, notified: ${_this.notified})';
}


}

/// @nodoc
abstract mixin class $UserAchievementModelCopyWith<$Res>  {
  factory $UserAchievementModelCopyWith(UserAchievementModel value, $Res Function(UserAchievementModel) _then) = _$UserAchievementModelCopyWithImpl;
@useResult
$Res call({
 String userAchievementId, String userId, String achievementId, DateTime unlockedAt, bool notified
});




}
/// @nodoc
class _$UserAchievementModelCopyWithImpl<$Res>
    implements $UserAchievementModelCopyWith<$Res> {
  _$UserAchievementModelCopyWithImpl(this._self, this._then);

  final UserAchievementModel _self;
  final $Res Function(UserAchievementModel) _then;

/// Create a copy of UserAchievementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userAchievementId = null,Object? userId = null,Object? achievementId = null,Object? unlockedAt = null,Object? notified = null,}) {
  return _then(UserAchievementModel(
userAchievementId: null == userAchievementId ? _self.userAchievementId : userAchievementId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as String,unlockedAt: null == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notified: null == notified ? _self.notified : notified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAchievementModel].
extension UserAchievementModelPatterns on UserAchievementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAchievementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAchievementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAchievementModel value)  $default,){
final _that = this;
switch (_that) {
case _UserAchievementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAchievementModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserAchievementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userAchievementId,  String userId,  String achievementId,  DateTime unlockedAt,  bool notified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAchievementModel() when $default != null:
return $default(_that.userAchievementId,_that.userId,_that.achievementId,_that.unlockedAt,_that.notified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userAchievementId,  String userId,  String achievementId,  DateTime unlockedAt,  bool notified)  $default,) {final _that = this;
switch (_that) {
case _UserAchievementModel():
return $default(_that.userAchievementId,_that.userId,_that.achievementId,_that.unlockedAt,_that.notified);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userAchievementId,  String userId,  String achievementId,  DateTime unlockedAt,  bool notified)?  $default,) {final _that = this;
switch (_that) {
case _UserAchievementModel() when $default != null:
return $default(_that.userAchievementId,_that.userId,_that.achievementId,_that.unlockedAt,_that.notified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAchievementModel implements UserAchievementModel {
  const _UserAchievementModel({required this.userAchievementId, required this.userId, required this.achievementId, required this.unlockedAt, this.notified = false});
  factory _UserAchievementModel.fromJson(Map<String, dynamic> json) => _$UserAchievementModelFromJson(json);

@override final  String userAchievementId;
@override final  String userId;
@override final  String achievementId;
@override final  DateTime unlockedAt;
@override@JsonKey() final  bool notified;

/// Create a copy of UserAchievementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAchievementModelCopyWith<_UserAchievementModel> get copyWith => __$UserAchievementModelCopyWithImpl<_UserAchievementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAchievementModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAchievementModel&&(identical(other.userAchievementId, userAchievementId) || other.userAchievementId == userAchievementId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.achievementId, achievementId) || other.achievementId == achievementId)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt)&&(identical(other.notified, notified) || other.notified == notified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userAchievementId,userId,achievementId,unlockedAt,notified);
}

@override
String toString() {
    return 'UserAchievementModel(userAchievementId: $userAchievementId, userId: $userId, achievementId: $achievementId, unlockedAt: $unlockedAt, notified: $notified)';
}


}

/// @nodoc
abstract mixin class _$UserAchievementModelCopyWith<$Res> implements $UserAchievementModelCopyWith<$Res> {
  factory _$UserAchievementModelCopyWith(_UserAchievementModel value, $Res Function(_UserAchievementModel) _then) = __$UserAchievementModelCopyWithImpl;
@override @useResult
$Res call({
 String userAchievementId, String userId, String achievementId, DateTime unlockedAt, bool notified
});




}
/// @nodoc
class __$UserAchievementModelCopyWithImpl<$Res>
    implements _$UserAchievementModelCopyWith<$Res> {
  __$UserAchievementModelCopyWithImpl(this._self, this._then);

  final _UserAchievementModel _self;
  final $Res Function(_UserAchievementModel) _then;

/// Create a copy of UserAchievementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userAchievementId = null,Object? userId = null,Object? achievementId = null,Object? unlockedAt = null,Object? notified = null,}) {
  return _then(_UserAchievementModel(
userAchievementId: null == userAchievementId ? _self.userAchievementId : userAchievementId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as String,unlockedAt: null == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notified: null == notified ? _self.notified : notified // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
