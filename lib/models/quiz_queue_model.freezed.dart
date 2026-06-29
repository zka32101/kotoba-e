// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_queue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizQueueModel _$QuizQueueModelFromJson(Map<String, dynamic> json) {
  return _QuizQueueModel.fromJson(json);
}

/// @nodoc
mixin _$QuizQueueModel {
  String get queueId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError; // YYYY-MM-DD
  String get userId => throw _privateConstructorUsedError;
  String get wordId => throw _privateConstructorUsedError;
  String get wordName => throw _privateConstructorUsedError;
  int get questionIndex => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this QuizQueueModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizQueueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizQueueModelCopyWith<QuizQueueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQueueModelCopyWith<$Res> {
  factory $QuizQueueModelCopyWith(
          QuizQueueModel value, $Res Function(QuizQueueModel) then) =
      _$QuizQueueModelCopyWithImpl<$Res, QuizQueueModel>;
  @useResult
  $Res call(
      {String queueId,
      String date,
      String userId,
      String wordId,
      String wordName,
      int questionIndex,
      DateTime createdAt});
}

/// @nodoc
class _$QuizQueueModelCopyWithImpl<$Res, $Val extends QuizQueueModel>
    implements $QuizQueueModelCopyWith<$Res> {
  _$QuizQueueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizQueueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queueId = null,
    Object? date = null,
    Object? userId = null,
    Object? wordId = null,
    Object? wordName = null,
    Object? questionIndex = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      queueId: null == queueId
          ? _value.queueId
          : queueId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
      questionIndex: null == questionIndex
          ? _value.questionIndex
          : questionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizQueueModelImplCopyWith<$Res>
    implements $QuizQueueModelCopyWith<$Res> {
  factory _$$QuizQueueModelImplCopyWith(_$QuizQueueModelImpl value,
          $Res Function(_$QuizQueueModelImpl) then) =
      __$$QuizQueueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String queueId,
      String date,
      String userId,
      String wordId,
      String wordName,
      int questionIndex,
      DateTime createdAt});
}

/// @nodoc
class __$$QuizQueueModelImplCopyWithImpl<$Res>
    extends _$QuizQueueModelCopyWithImpl<$Res, _$QuizQueueModelImpl>
    implements _$$QuizQueueModelImplCopyWith<$Res> {
  __$$QuizQueueModelImplCopyWithImpl(
      _$QuizQueueModelImpl _value, $Res Function(_$QuizQueueModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizQueueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queueId = null,
    Object? date = null,
    Object? userId = null,
    Object? wordId = null,
    Object? wordName = null,
    Object? questionIndex = null,
    Object? createdAt = null,
  }) {
    return _then(_$QuizQueueModelImpl(
      queueId: null == queueId
          ? _value.queueId
          : queueId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
      questionIndex: null == questionIndex
          ? _value.questionIndex
          : questionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQueueModelImpl implements _QuizQueueModel {
  const _$QuizQueueModelImpl(
      {required this.queueId,
      required this.date,
      required this.userId,
      required this.wordId,
      required this.wordName,
      required this.questionIndex,
      required this.createdAt});

  factory _$QuizQueueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQueueModelImplFromJson(json);

  @override
  final String queueId;
  @override
  final String date;
// YYYY-MM-DD
  @override
  final String userId;
  @override
  final String wordId;
  @override
  final String wordName;
  @override
  final int questionIndex;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'QuizQueueModel(queueId: $queueId, date: $date, userId: $userId, wordId: $wordId, wordName: $wordName, questionIndex: $questionIndex, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQueueModelImpl &&
            (identical(other.queueId, queueId) || other.queueId == queueId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.wordName, wordName) ||
                other.wordName == wordName) &&
            (identical(other.questionIndex, questionIndex) ||
                other.questionIndex == questionIndex) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, queueId, date, userId, wordId,
      wordName, questionIndex, createdAt);

  /// Create a copy of QuizQueueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQueueModelImplCopyWith<_$QuizQueueModelImpl> get copyWith =>
      __$$QuizQueueModelImplCopyWithImpl<_$QuizQueueModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQueueModelImplToJson(
      this,
    );
  }
}

abstract class _QuizQueueModel implements QuizQueueModel {
  const factory _QuizQueueModel(
      {required final String queueId,
      required final String date,
      required final String userId,
      required final String wordId,
      required final String wordName,
      required final int questionIndex,
      required final DateTime createdAt}) = _$QuizQueueModelImpl;

  factory _QuizQueueModel.fromJson(Map<String, dynamic> json) =
      _$QuizQueueModelImpl.fromJson;

  @override
  String get queueId;
  @override
  String get date; // YYYY-MM-DD
  @override
  String get userId;
  @override
  String get wordId;
  @override
  String get wordName;
  @override
  int get questionIndex;
  @override
  DateTime get createdAt;

  /// Create a copy of QuizQueueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizQueueModelImplCopyWith<_$QuizQueueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestion {
  String get wordId => throw _privateConstructorUsedError;
  String get wordName => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get options => throw _privateConstructorUsedError;
  int get correctIndex => throw _privateConstructorUsedError;
  int get questionNumber => throw _privateConstructorUsedError;
  int get totalQuestions => throw _privateConstructorUsedError;

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
          QuizQuestion value, $Res Function(QuizQuestion) then) =
      _$QuizQuestionCopyWithImpl<$Res, QuizQuestion>;
  @useResult
  $Res call(
      {String wordId,
      String wordName,
      String question,
      List<String> options,
      int correctIndex,
      int questionNumber,
      int totalQuestions});
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res, $Val extends QuizQuestion>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
    Object? wordName = null,
    Object? question = null,
    Object? options = null,
    Object? correctIndex = null,
    Object? questionNumber = null,
    Object? totalQuestions = null,
  }) {
    return _then(_value.copyWith(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      wordName: null == wordName
          ? _value.wordName
          : wordName // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctIndex: null == correctIndex
          ? _value.correctIndex
          : correctIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questionNumber: null == questionNumber
          ? _value.questionNumber
          : questionNumber // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizQuestionImplCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$$QuizQuestionImplCopyWith(
          _$QuizQuestionImpl value, $Res Function(_$QuizQuestionImpl) then) =
      __$$QuizQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String wordId,
      String wordName,
      String question,
      List<String> options,
      int correctIndex,
      int questionNumber,
      int totalQuestions});
}

/// @nodoc
class __$$QuizQuestionImplCopyWithImpl<$Res>
    extends _$QuizQuestionCopyWithImpl<$Res, _$QuizQuestionImpl>
    implements _$$QuizQuestionImplCopyWith<$Res> {
  __$$QuizQuestionImplCopyWithImpl(
      _$QuizQuestionImpl _value, $Res Function(_$QuizQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
    Object? wordName = null,
    Object? question = null,
    Object? options = null,
    Object? correctIndex = null,
    Object? questionNumber = null,
    Object? totalQuestions = null,
  }) {
    return _then(_$QuizQuestionImpl(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      wordName: null == wordName
          ? _value.wordName
          : wordName // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctIndex: null == correctIndex
          ? _value.correctIndex
          : correctIndex // ignore: cast_nullable_to_non_nullable
              as int,
      questionNumber: null == questionNumber
          ? _value.questionNumber
          : questionNumber // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQuestionImpl implements _QuizQuestion {
  const _$QuizQuestionImpl(
      {required this.wordId,
      required this.wordName,
      required this.question,
      required final List<String> options,
      required this.correctIndex,
      required this.questionNumber,
      required this.totalQuestions})
      : _options = options;

  factory _$QuizQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQuestionImplFromJson(json);

  @override
  final String wordId;
  @override
  final String wordName;
  @override
  final String question;
  final List<String> _options;
  @override
  List<String> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int correctIndex;
  @override
  final int questionNumber;
  @override
  final int totalQuestions;

  @override
  String toString() {
    return 'QuizQuestion(wordId: $wordId, wordName: $wordName, question: $question, options: $options, correctIndex: $correctIndex, questionNumber: $questionNumber, totalQuestions: $totalQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQuestionImpl &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.wordName, wordName) ||
                other.wordName == wordName) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctIndex, correctIndex) ||
                other.correctIndex == correctIndex) &&
            (identical(other.questionNumber, questionNumber) ||
                other.questionNumber == questionNumber) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      wordId,
      wordName,
      question,
      const DeepCollectionEquality().hash(_options),
      correctIndex,
      questionNumber,
      totalQuestions);

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      __$$QuizQuestionImplCopyWithImpl<_$QuizQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQuestionImplToJson(
      this,
    );
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  const factory _QuizQuestion(
      {required final String wordId,
      required final String wordName,
      required final String question,
      required final List<String> options,
      required final int correctIndex,
      required final int questionNumber,
      required final int totalQuestions}) = _$QuizQuestionImpl;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$QuizQuestionImpl.fromJson;

  @override
  String get wordId;
  @override
  String get wordName;
  @override
  String get question;
  @override
  List<String> get options;
  @override
  int get correctIndex;
  @override
  int get questionNumber;
  @override
  int get totalQuestions;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) {
  return _QuizAnswer.fromJson(json);
}

/// @nodoc
mixin _$QuizAnswer {
  String get wordId => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;
  String get explanation => throw _privateConstructorUsedError;
  DateTime get nextReviewDate => throw _privateConstructorUsedError;
  String get newDifficulty => throw _privateConstructorUsedError;

  /// Serializes this QuizAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizAnswerCopyWith<QuizAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizAnswerCopyWith<$Res> {
  factory $QuizAnswerCopyWith(
          QuizAnswer value, $Res Function(QuizAnswer) then) =
      _$QuizAnswerCopyWithImpl<$Res, QuizAnswer>;
  @useResult
  $Res call(
      {String wordId,
      bool isCorrect,
      String explanation,
      DateTime nextReviewDate,
      String newDifficulty});
}

/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res, $Val extends QuizAnswer>
    implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
    Object? isCorrect = null,
    Object? explanation = null,
    Object? nextReviewDate = null,
    Object? newDifficulty = null,
  }) {
    return _then(_value.copyWith(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      nextReviewDate: null == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newDifficulty: null == newDifficulty
          ? _value.newDifficulty
          : newDifficulty // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizAnswerImplCopyWith<$Res>
    implements $QuizAnswerCopyWith<$Res> {
  factory _$$QuizAnswerImplCopyWith(
          _$QuizAnswerImpl value, $Res Function(_$QuizAnswerImpl) then) =
      __$$QuizAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String wordId,
      bool isCorrect,
      String explanation,
      DateTime nextReviewDate,
      String newDifficulty});
}

/// @nodoc
class __$$QuizAnswerImplCopyWithImpl<$Res>
    extends _$QuizAnswerCopyWithImpl<$Res, _$QuizAnswerImpl>
    implements _$$QuizAnswerImplCopyWith<$Res> {
  __$$QuizAnswerImplCopyWithImpl(
      _$QuizAnswerImpl _value, $Res Function(_$QuizAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
    Object? isCorrect = null,
    Object? explanation = null,
    Object? nextReviewDate = null,
    Object? newDifficulty = null,
  }) {
    return _then(_$QuizAnswerImpl(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      nextReviewDate: null == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      newDifficulty: null == newDifficulty
          ? _value.newDifficulty
          : newDifficulty // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizAnswerImpl implements _QuizAnswer {
  const _$QuizAnswerImpl(
      {required this.wordId,
      required this.isCorrect,
      required this.explanation,
      required this.nextReviewDate,
      required this.newDifficulty});

  factory _$QuizAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizAnswerImplFromJson(json);

  @override
  final String wordId;
  @override
  final bool isCorrect;
  @override
  final String explanation;
  @override
  final DateTime nextReviewDate;
  @override
  final String newDifficulty;

  @override
  String toString() {
    return 'QuizAnswer(wordId: $wordId, isCorrect: $isCorrect, explanation: $explanation, nextReviewDate: $nextReviewDate, newDifficulty: $newDifficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizAnswerImpl &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.nextReviewDate, nextReviewDate) ||
                other.nextReviewDate == nextReviewDate) &&
            (identical(other.newDifficulty, newDifficulty) ||
                other.newDifficulty == newDifficulty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wordId, isCorrect, explanation,
      nextReviewDate, newDifficulty);

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizAnswerImplCopyWith<_$QuizAnswerImpl> get copyWith =>
      __$$QuizAnswerImplCopyWithImpl<_$QuizAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizAnswerImplToJson(
      this,
    );
  }
}

abstract class _QuizAnswer implements QuizAnswer {
  const factory _QuizAnswer(
      {required final String wordId,
      required final bool isCorrect,
      required final String explanation,
      required final DateTime nextReviewDate,
      required final String newDifficulty}) = _$QuizAnswerImpl;

  factory _QuizAnswer.fromJson(Map<String, dynamic> json) =
      _$QuizAnswerImpl.fromJson;

  @override
  String get wordId;
  @override
  bool get isCorrect;
  @override
  String get explanation;
  @override
  DateTime get nextReviewDate;
  @override
  String get newDifficulty;

  /// Create a copy of QuizAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizAnswerImplCopyWith<_$QuizAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
