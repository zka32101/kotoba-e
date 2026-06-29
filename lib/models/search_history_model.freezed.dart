// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchHistoryModel _$SearchHistoryModelFromJson(Map<String, dynamic> json) {
  return _SearchHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$SearchHistoryModel {
  String get searchHistoryId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get wordId => throw _privateConstructorUsedError;
  String get wordName => throw _privateConstructorUsedError;
  DateTime get searchedAt => throw _privateConstructorUsedError;
  DateTime get nextReviewDate => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  DateTime? get lastReviewedAt => throw _privateConstructorUsedError;

  /// Serializes this SearchHistoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchHistoryModelCopyWith<SearchHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHistoryModelCopyWith<$Res> {
  factory $SearchHistoryModelCopyWith(
          SearchHistoryModel value, $Res Function(SearchHistoryModel) then) =
      _$SearchHistoryModelCopyWithImpl<$Res, SearchHistoryModel>;
  @useResult
  $Res call(
      {String searchHistoryId,
      String userId,
      String wordId,
      String wordName,
      DateTime searchedAt,
      DateTime nextReviewDate,
      int reviewCount,
      String difficulty,
      DateTime? lastReviewedAt});
}

/// @nodoc
class _$SearchHistoryModelCopyWithImpl<$Res, $Val extends SearchHistoryModel>
    implements $SearchHistoryModelCopyWith<$Res> {
  _$SearchHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHistoryId = null,
    Object? userId = null,
    Object? wordId = null,
    Object? wordName = null,
    Object? searchedAt = null,
    Object? nextReviewDate = null,
    Object? reviewCount = null,
    Object? difficulty = null,
    Object? lastReviewedAt = freezed,
  }) {
    return _then(_value.copyWith(
      searchHistoryId: null == searchHistoryId
          ? _value.searchHistoryId
          : searchHistoryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      wordName: null == wordName
          ? _value.wordName
          : wordName // ignore: cast_nullable_to_non_nullable
              as String,
      searchedAt: null == searchedAt
          ? _value.searchedAt
          : searchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextReviewDate: null == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      lastReviewedAt: freezed == lastReviewedAt
          ? _value.lastReviewedAt
          : lastReviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchHistoryModelImplCopyWith<$Res>
    implements $SearchHistoryModelCopyWith<$Res> {
  factory _$$SearchHistoryModelImplCopyWith(_$SearchHistoryModelImpl value,
          $Res Function(_$SearchHistoryModelImpl) then) =
      __$$SearchHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchHistoryId,
      String userId,
      String wordId,
      String wordName,
      DateTime searchedAt,
      DateTime nextReviewDate,
      int reviewCount,
      String difficulty,
      DateTime? lastReviewedAt});
}

/// @nodoc
class __$$SearchHistoryModelImplCopyWithImpl<$Res>
    extends _$SearchHistoryModelCopyWithImpl<$Res, _$SearchHistoryModelImpl>
    implements _$$SearchHistoryModelImplCopyWith<$Res> {
  __$$SearchHistoryModelImplCopyWithImpl(_$SearchHistoryModelImpl _value,
      $Res Function(_$SearchHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHistoryId = null,
    Object? userId = null,
    Object? wordId = null,
    Object? wordName = null,
    Object? searchedAt = null,
    Object? nextReviewDate = null,
    Object? reviewCount = null,
    Object? difficulty = null,
    Object? lastReviewedAt = freezed,
  }) {
    return _then(_$SearchHistoryModelImpl(
      searchHistoryId: null == searchHistoryId
          ? _value.searchHistoryId
          : searchHistoryId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      wordName: null == wordName
          ? _value.wordName
          : wordName // ignore: cast_nullable_to_non_nullable
              as String,
      searchedAt: null == searchedAt
          ? _value.searchedAt
          : searchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextReviewDate: null == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      lastReviewedAt: freezed == lastReviewedAt
          ? _value.lastReviewedAt
          : lastReviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchHistoryModelImpl implements _SearchHistoryModel {
  const _$SearchHistoryModelImpl(
      {required this.searchHistoryId,
      required this.userId,
      required this.wordId,
      required this.wordName,
      required this.searchedAt,
      required this.nextReviewDate,
      this.reviewCount = 0,
      this.difficulty = 'normal',
      this.lastReviewedAt});

  factory _$SearchHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchHistoryModelImplFromJson(json);

  @override
  final String searchHistoryId;
  @override
  final String userId;
  @override
  final String wordId;
  @override
  final String wordName;
  @override
  final DateTime searchedAt;
  @override
  final DateTime nextReviewDate;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  @JsonKey()
  final String difficulty;
  @override
  final DateTime? lastReviewedAt;

  @override
  String toString() {
    return 'SearchHistoryModel(searchHistoryId: $searchHistoryId, userId: $userId, wordId: $wordId, wordName: $wordName, searchedAt: $searchedAt, nextReviewDate: $nextReviewDate, reviewCount: $reviewCount, difficulty: $difficulty, lastReviewedAt: $lastReviewedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHistoryModelImpl &&
            (identical(other.searchHistoryId, searchHistoryId) ||
                other.searchHistoryId == searchHistoryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.wordName, wordName) ||
                other.wordName == wordName) &&
            (identical(other.searchedAt, searchedAt) ||
                other.searchedAt == searchedAt) &&
            (identical(other.nextReviewDate, nextReviewDate) ||
                other.nextReviewDate == nextReviewDate) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.lastReviewedAt, lastReviewedAt) ||
                other.lastReviewedAt == lastReviewedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      searchHistoryId,
      userId,
      wordId,
      wordName,
      searchedAt,
      nextReviewDate,
      reviewCount,
      difficulty,
      lastReviewedAt);

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHistoryModelImplCopyWith<_$SearchHistoryModelImpl> get copyWith =>
      __$$SearchHistoryModelImplCopyWithImpl<_$SearchHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _SearchHistoryModel implements SearchHistoryModel {
  const factory _SearchHistoryModel(
      {required final String searchHistoryId,
      required final String userId,
      required final String wordId,
      required final String wordName,
      required final DateTime searchedAt,
      required final DateTime nextReviewDate,
      final int reviewCount,
      final String difficulty,
      final DateTime? lastReviewedAt}) = _$SearchHistoryModelImpl;

  factory _SearchHistoryModel.fromJson(Map<String, dynamic> json) =
      _$SearchHistoryModelImpl.fromJson;

  @override
  String get searchHistoryId;
  @override
  String get userId;
  @override
  String get wordId;
  @override
  String get wordName;
  @override
  DateTime get searchedAt;
  @override
  DateTime get nextReviewDate;
  @override
  int get reviewCount;
  @override
  String get difficulty;
  @override
  DateTime? get lastReviewedAt;

  /// Create a copy of SearchHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchHistoryModelImplCopyWith<_$SearchHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
