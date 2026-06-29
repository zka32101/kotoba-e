// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AchievementModel _$AchievementModelFromJson(Map<String, dynamic> json) {
  return _AchievementModel.fromJson(json);
}

/// @nodoc
mixin _$AchievementModel {
  String get achievementId => throw _privateConstructorUsedError;
  String get achievementType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  /// Serializes this AchievementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementModelCopyWith<AchievementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementModelCopyWith<$Res> {
  factory $AchievementModelCopyWith(
          AchievementModel value, $Res Function(AchievementModel) then) =
      _$AchievementModelCopyWithImpl<$Res, AchievementModel>;
  @useResult
  $Res call(
      {String achievementId,
      String achievementType,
      String description,
      String? iconUrl});
}

/// @nodoc
class _$AchievementModelCopyWithImpl<$Res, $Val extends AchievementModel>
    implements $AchievementModelCopyWith<$Res> {
  _$AchievementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? achievementType = null,
    Object? description = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      achievementType: null == achievementType
          ? _value.achievementType
          : achievementType // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementModelImplCopyWith<$Res>
    implements $AchievementModelCopyWith<$Res> {
  factory _$$AchievementModelImplCopyWith(_$AchievementModelImpl value,
          $Res Function(_$AchievementModelImpl) then) =
      __$$AchievementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String achievementId,
      String achievementType,
      String description,
      String? iconUrl});
}

/// @nodoc
class __$$AchievementModelImplCopyWithImpl<$Res>
    extends _$AchievementModelCopyWithImpl<$Res, _$AchievementModelImpl>
    implements _$$AchievementModelImplCopyWith<$Res> {
  __$$AchievementModelImplCopyWithImpl(_$AchievementModelImpl _value,
      $Res Function(_$AchievementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementId = null,
    Object? achievementType = null,
    Object? description = null,
    Object? iconUrl = freezed,
  }) {
    return _then(_$AchievementModelImpl(
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      achievementType: null == achievementType
          ? _value.achievementType
          : achievementType // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementModelImpl implements _AchievementModel {
  const _$AchievementModelImpl(
      {required this.achievementId,
      this.achievementType = 'streak_7days',
      required this.description,
      this.iconUrl});

  factory _$AchievementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementModelImplFromJson(json);

  @override
  final String achievementId;
  @override
  @JsonKey()
  final String achievementType;
  @override
  final String description;
  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'AchievementModel(achievementId: $achievementId, achievementType: $achievementType, description: $description, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementModelImpl &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.achievementType, achievementType) ||
                other.achievementType == achievementType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, achievementId, achievementType, description, iconUrl);

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementModelImplCopyWith<_$AchievementModelImpl> get copyWith =>
      __$$AchievementModelImplCopyWithImpl<_$AchievementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementModelImplToJson(
      this,
    );
  }
}

abstract class _AchievementModel implements AchievementModel {
  const factory _AchievementModel(
      {required final String achievementId,
      final String achievementType,
      required final String description,
      final String? iconUrl}) = _$AchievementModelImpl;

  factory _AchievementModel.fromJson(Map<String, dynamic> json) =
      _$AchievementModelImpl.fromJson;

  @override
  String get achievementId;
  @override
  String get achievementType;
  @override
  String get description;
  @override
  String? get iconUrl;

  /// Create a copy of AchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementModelImplCopyWith<_$AchievementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserAchievementModel _$UserAchievementModelFromJson(Map<String, dynamic> json) {
  return _UserAchievementModel.fromJson(json);
}

/// @nodoc
mixin _$UserAchievementModel {
  String get userAchievementId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get achievementId => throw _privateConstructorUsedError;
  DateTime get unlockedAt => throw _privateConstructorUsedError;
  bool get notified => throw _privateConstructorUsedError;

  /// Serializes this UserAchievementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAchievementModelCopyWith<UserAchievementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAchievementModelCopyWith<$Res> {
  factory $UserAchievementModelCopyWith(UserAchievementModel value,
          $Res Function(UserAchievementModel) then) =
      _$UserAchievementModelCopyWithImpl<$Res, UserAchievementModel>;
  @useResult
  $Res call(
      {String userAchievementId,
      String userId,
      String achievementId,
      DateTime unlockedAt,
      bool notified});
}

/// @nodoc
class _$UserAchievementModelCopyWithImpl<$Res,
        $Val extends UserAchievementModel>
    implements $UserAchievementModelCopyWith<$Res> {
  _$UserAchievementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAchievementId = null,
    Object? userId = null,
    Object? achievementId = null,
    Object? unlockedAt = null,
    Object? notified = null,
  }) {
    return _then(_value.copyWith(
      userAchievementId: null == userAchievementId
          ? _value.userAchievementId
          : userAchievementId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      unlockedAt: null == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notified: null == notified
          ? _value.notified
          : notified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAchievementModelImplCopyWith<$Res>
    implements $UserAchievementModelCopyWith<$Res> {
  factory _$$UserAchievementModelImplCopyWith(_$UserAchievementModelImpl value,
          $Res Function(_$UserAchievementModelImpl) then) =
      __$$UserAchievementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userAchievementId,
      String userId,
      String achievementId,
      DateTime unlockedAt,
      bool notified});
}

/// @nodoc
class __$$UserAchievementModelImplCopyWithImpl<$Res>
    extends _$UserAchievementModelCopyWithImpl<$Res, _$UserAchievementModelImpl>
    implements _$$UserAchievementModelImplCopyWith<$Res> {
  __$$UserAchievementModelImplCopyWithImpl(_$UserAchievementModelImpl _value,
      $Res Function(_$UserAchievementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAchievementId = null,
    Object? userId = null,
    Object? achievementId = null,
    Object? unlockedAt = null,
    Object? notified = null,
  }) {
    return _then(_$UserAchievementModelImpl(
      userAchievementId: null == userAchievementId
          ? _value.userAchievementId
          : userAchievementId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      achievementId: null == achievementId
          ? _value.achievementId
          : achievementId // ignore: cast_nullable_to_non_nullable
              as String,
      unlockedAt: null == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notified: null == notified
          ? _value.notified
          : notified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAchievementModelImpl implements _UserAchievementModel {
  const _$UserAchievementModelImpl(
      {required this.userAchievementId,
      required this.userId,
      required this.achievementId,
      required this.unlockedAt,
      this.notified = false});

  factory _$UserAchievementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAchievementModelImplFromJson(json);

  @override
  final String userAchievementId;
  @override
  final String userId;
  @override
  final String achievementId;
  @override
  final DateTime unlockedAt;
  @override
  @JsonKey()
  final bool notified;

  @override
  String toString() {
    return 'UserAchievementModel(userAchievementId: $userAchievementId, userId: $userId, achievementId: $achievementId, unlockedAt: $unlockedAt, notified: $notified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAchievementModelImpl &&
            (identical(other.userAchievementId, userAchievementId) ||
                other.userAchievementId == userAchievementId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.achievementId, achievementId) ||
                other.achievementId == achievementId) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.notified, notified) ||
                other.notified == notified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userAchievementId, userId,
      achievementId, unlockedAt, notified);

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAchievementModelImplCopyWith<_$UserAchievementModelImpl>
      get copyWith =>
          __$$UserAchievementModelImplCopyWithImpl<_$UserAchievementModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAchievementModelImplToJson(
      this,
    );
  }
}

abstract class _UserAchievementModel implements UserAchievementModel {
  const factory _UserAchievementModel(
      {required final String userAchievementId,
      required final String userId,
      required final String achievementId,
      required final DateTime unlockedAt,
      final bool notified}) = _$UserAchievementModelImpl;

  factory _UserAchievementModel.fromJson(Map<String, dynamic> json) =
      _$UserAchievementModelImpl.fromJson;

  @override
  String get userAchievementId;
  @override
  String get userId;
  @override
  String get achievementId;
  @override
  DateTime get unlockedAt;
  @override
  bool get notified;

  /// Create a copy of UserAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAchievementModelImplCopyWith<_$UserAchievementModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
