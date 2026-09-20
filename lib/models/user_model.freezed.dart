// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get userId; String get email; String? get displayName; String get userType; int get gradeLevel; String get selectedLanguage; String get subscriptionStatus; DateTime? get subscriptionExpiresAt; String get textDisplayMode; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.userType, _this.userType) || other.userType == _this.userType)&&(identical(other.gradeLevel, _this.gradeLevel) || other.gradeLevel == _this.gradeLevel)&&(identical(other.selectedLanguage, _this.selectedLanguage) || other.selectedLanguage == _this.selectedLanguage)&&(identical(other.subscriptionStatus, _this.subscriptionStatus) || other.subscriptionStatus == _this.subscriptionStatus)&&(identical(other.subscriptionExpiresAt, _this.subscriptionExpiresAt) || other.subscriptionExpiresAt == _this.subscriptionExpiresAt)&&(identical(other.textDisplayMode, _this.textDisplayMode) || other.textDisplayMode == _this.textDisplayMode)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserModel;
  return Object.hash(runtimeType,_this.userId,_this.email,_this.displayName,_this.userType,_this.gradeLevel,_this.selectedLanguage,_this.subscriptionStatus,_this.subscriptionExpiresAt,_this.textDisplayMode,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as UserModel;
  return 'UserModel(userId: ${_this.userId}, email: ${_this.email}, displayName: ${_this.displayName}, userType: ${_this.userType}, gradeLevel: ${_this.gradeLevel}, selectedLanguage: ${_this.selectedLanguage}, subscriptionStatus: ${_this.subscriptionStatus}, subscriptionExpiresAt: ${_this.subscriptionExpiresAt}, textDisplayMode: ${_this.textDisplayMode}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String userId, String email, String? displayName, String userType, int gradeLevel, String selectedLanguage, String subscriptionStatus, DateTime? subscriptionExpiresAt, String textDisplayMode, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? displayName = freezed,Object? userType = null,Object? gradeLevel = null,Object? selectedLanguage = null,Object? subscriptionStatus = null,Object? subscriptionExpiresAt = freezed,Object? textDisplayMode = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(UserModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String,gradeLevel: null == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as int,selectedLanguage: null == selectedLanguage ? _self.selectedLanguage : selectedLanguage // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionExpiresAt: freezed == subscriptionExpiresAt ? _self.subscriptionExpiresAt : subscriptionExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,textDisplayMode: null == textDisplayMode ? _self.textDisplayMode : textDisplayMode // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String email,  String? displayName,  String userType,  int gradeLevel,  String selectedLanguage,  String subscriptionStatus,  DateTime? subscriptionExpiresAt,  String textDisplayMode,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.userId,_that.email,_that.displayName,_that.userType,_that.gradeLevel,_that.selectedLanguage,_that.subscriptionStatus,_that.subscriptionExpiresAt,_that.textDisplayMode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String email,  String? displayName,  String userType,  int gradeLevel,  String selectedLanguage,  String subscriptionStatus,  DateTime? subscriptionExpiresAt,  String textDisplayMode,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.userId,_that.email,_that.displayName,_that.userType,_that.gradeLevel,_that.selectedLanguage,_that.subscriptionStatus,_that.subscriptionExpiresAt,_that.textDisplayMode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String email,  String? displayName,  String userType,  int gradeLevel,  String selectedLanguage,  String subscriptionStatus,  DateTime? subscriptionExpiresAt,  String textDisplayMode,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.userId,_that.email,_that.displayName,_that.userType,_that.gradeLevel,_that.selectedLanguage,_that.subscriptionStatus,_that.subscriptionExpiresAt,_that.textDisplayMode,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.userId, required this.email, this.displayName, this.userType = 'domestic', this.gradeLevel = 1, this.selectedLanguage = 'ja', this.subscriptionStatus = 'free', this.subscriptionExpiresAt, this.textDisplayMode = 'japanese_furigana', required this.createdAt, required this.updatedAt});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String userId;
@override final  String email;
@override final  String? displayName;
@override@JsonKey() final  String userType;
@override@JsonKey() final  int gradeLevel;
@override@JsonKey() final  String selectedLanguage;
@override@JsonKey() final  String subscriptionStatus;
@override final  DateTime? subscriptionExpiresAt;
@override@JsonKey() final  String textDisplayMode;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.gradeLevel, gradeLevel) || other.gradeLevel == gradeLevel)&&(identical(other.selectedLanguage, selectedLanguage) || other.selectedLanguage == selectedLanguage)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.subscriptionExpiresAt, subscriptionExpiresAt) || other.subscriptionExpiresAt == subscriptionExpiresAt)&&(identical(other.textDisplayMode, textDisplayMode) || other.textDisplayMode == textDisplayMode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,email,displayName,userType,gradeLevel,selectedLanguage,subscriptionStatus,subscriptionExpiresAt,textDisplayMode,createdAt,updatedAt);
}

@override
String toString() {
    return 'UserModel(userId: $userId, email: $email, displayName: $displayName, userType: $userType, gradeLevel: $gradeLevel, selectedLanguage: $selectedLanguage, subscriptionStatus: $subscriptionStatus, subscriptionExpiresAt: $subscriptionExpiresAt, textDisplayMode: $textDisplayMode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String email, String? displayName, String userType, int gradeLevel, String selectedLanguage, String subscriptionStatus, DateTime? subscriptionExpiresAt, String textDisplayMode, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? displayName = freezed,Object? userType = null,Object? gradeLevel = null,Object? selectedLanguage = null,Object? subscriptionStatus = null,Object? subscriptionExpiresAt = freezed,Object? textDisplayMode = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,userType: null == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String,gradeLevel: null == gradeLevel ? _self.gradeLevel : gradeLevel // ignore: cast_nullable_to_non_nullable
as int,selectedLanguage: null == selectedLanguage ? _self.selectedLanguage : selectedLanguage // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: null == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String,subscriptionExpiresAt: freezed == subscriptionExpiresAt ? _self.subscriptionExpiresAt : subscriptionExpiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,textDisplayMode: null == textDisplayMode ? _self.textDisplayMode : textDisplayMode // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
