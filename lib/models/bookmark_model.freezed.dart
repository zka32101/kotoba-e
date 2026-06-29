// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookmarkModel _$BookmarkModelFromJson(Map<String, dynamic> json) {
  return _BookmarkModel.fromJson(json);
}

/// @nodoc
mixin _$BookmarkModel {
  String get bookmarkId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get wordId => throw _privateConstructorUsedError;
  String get wordName => throw _privateConstructorUsedError;
  DateTime get bookmarkedAt => throw _privateConstructorUsedError;
  DateTime? get reviewedAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this BookmarkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkModelCopyWith<BookmarkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkModelCopyWith<$Res> {
  factory $BookmarkModelCopyWith(
          BookmarkModel value, $Res Function(BookmarkModel) then) =
      _$BookmarkModelCopyWithImpl<$Res, BookmarkModel>;
  @useResult
  $Res call(
      {String bookmarkId,
      String userId,
      String wordId,
      String wordName,
      DateTime bookmarkedAt,
      DateTime? reviewedAt,
      String status});
}

/// @nodoc
class _$BookmarkModelCopyWithImpl<$Res, $Val extends BookmarkModel>
    implements $BookmarkModelCopyWith<$Res> {
  _$BookmarkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkId = null,
    Object? userId = null,
    Object? wordId = null,
    Object? wordName = null,
    Object? bookmarkedAt = null,
    Object? reviewedAt = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      bookmarkId: null == bookmarkId
          ? _value.bookmarkId
          : bookmarkId // ignore: cast_nullable_to_non_nullable
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
      bookmarkedAt: null == bookmarkedAt
          ? _value.bookmarkedAt
          : bookmarkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewedAt: freezed == reviewedAt
          ? _value.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkModelImplCopyWith<$Res>
    implements $BookmarkModelCopyWith<$Res> {
  factory _$$BookmarkModelImplCopyWith(
          _$BookmarkModelImpl value, $Res Function(_$BookmarkModelImpl) then) =
      __$$BookmarkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookmarkId,
      String userId,
      String wordId,
      String wordName,
      DateTime bookmarkedAt,
      DateTime? reviewedAt,
      String status});
}

/// @nodoc
class __$$BookmarkModelImplCopyWithImpl<$Res>
    extends _$BookmarkModelCopyWithImpl<$Res, _$BookmarkModelImpl>
    implements _$$BookmarkModelImplCopyWith<$Res> {
  __$$BookmarkModelImplCopyWithImpl(
      _$BookmarkModelImpl _value, $Res Function(_$BookmarkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookmarkId = null,
    Object? userId = null,
    Object? wordId = null,
    Object? wordName = null,
    Object? bookmarkedAt = null,
    Object? reviewedAt = freezed,
    Object? status = null,
  }) {
    return _then(_$BookmarkModelImpl(
      bookmarkId: null == bookmarkId
          ? _value.bookmarkId
          : bookmarkId // ignore: cast_nullable_to_non_nullable
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
      bookmarkedAt: null == bookmarkedAt
          ? _value.bookmarkedAt
          : bookmarkedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviewedAt: freezed == reviewedAt
          ? _value.reviewedAt
          : reviewedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkModelImpl implements _BookmarkModel {
  const _$BookmarkModelImpl(
      {required this.bookmarkId,
      required this.userId,
      required this.wordId,
      required this.wordName,
      required this.bookmarkedAt,
      this.reviewedAt,
      this.status = 'new'});

  factory _$BookmarkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkModelImplFromJson(json);

  @override
  final String bookmarkId;
  @override
  final String userId;
  @override
  final String wordId;
  @override
  final String wordName;
  @override
  final DateTime bookmarkedAt;
  @override
  final DateTime? reviewedAt;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'BookmarkModel(bookmarkId: $bookmarkId, userId: $userId, wordId: $wordId, wordName: $wordName, bookmarkedAt: $bookmarkedAt, reviewedAt: $reviewedAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkModelImpl &&
            (identical(other.bookmarkId, bookmarkId) ||
                other.bookmarkId == bookmarkId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.wordName, wordName) ||
                other.wordName == wordName) &&
            (identical(other.bookmarkedAt, bookmarkedAt) ||
                other.bookmarkedAt == bookmarkedAt) &&
            (identical(other.reviewedAt, reviewedAt) ||
                other.reviewedAt == reviewedAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookmarkId, userId, wordId,
      wordName, bookmarkedAt, reviewedAt, status);

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkModelImplCopyWith<_$BookmarkModelImpl> get copyWith =>
      __$$BookmarkModelImplCopyWithImpl<_$BookmarkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkModelImplToJson(
      this,
    );
  }
}

abstract class _BookmarkModel implements BookmarkModel {
  const factory _BookmarkModel(
      {required final String bookmarkId,
      required final String userId,
      required final String wordId,
      required final String wordName,
      required final DateTime bookmarkedAt,
      final DateTime? reviewedAt,
      final String status}) = _$BookmarkModelImpl;

  factory _BookmarkModel.fromJson(Map<String, dynamic> json) =
      _$BookmarkModelImpl.fromJson;

  @override
  String get bookmarkId;
  @override
  String get userId;
  @override
  String get wordId;
  @override
  String get wordName;
  @override
  DateTime get bookmarkedAt;
  @override
  DateTime? get reviewedAt;
  @override
  String get status;

  /// Create a copy of BookmarkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkModelImplCopyWith<_$BookmarkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
