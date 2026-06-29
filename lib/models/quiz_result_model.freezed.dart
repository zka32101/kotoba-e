// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizResultModel _$QuizResultModelFromJson(Map<String, dynamic> json) {
  return _QuizResultModel.fromJson(json);
}

/// @nodoc
mixin _$QuizResultModel {
  String get resultId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get quizDate => throw _privateConstructorUsedError;
  String get questionWordId => throw _privateConstructorUsedError;
  bool get correctAnswer => throw _privateConstructorUsedError;
  String get selectedAnswer => throw _privateConstructorUsedError;
  String get correctAnswerText => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;

  /// Serializes this QuizResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultModelCopyWith<QuizResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultModelCopyWith<$Res> {
  factory $QuizResultModelCopyWith(
          QuizResultModel value, $Res Function(QuizResultModel) then) =
      _$QuizResultModelCopyWithImpl<$Res, QuizResultModel>;
  @useResult
  $Res call(
      {String resultId,
      String userId,
      DateTime quizDate,
      String questionWordId,
      bool correctAnswer,
      String selectedAnswer,
      String correctAnswerText,
      DateTime completedAt});
}

/// @nodoc
class _$QuizResultModelCopyWithImpl<$Res, $Val extends QuizResultModel>
    implements $QuizResultModelCopyWith<$Res> {
  _$QuizResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultId = null,
    Object? userId = null,
    Object? quizDate = null,
    Object? questionWordId = null,
    Object? correctAnswer = null,
    Object? selectedAnswer = null,
    Object? correctAnswerText = null,
    Object? completedAt = null,
  }) {
    return _then(_value.copyWith(
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quizDate: null == quizDate
          ? _value.quizDate
          : quizDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      questionWordId: null == questionWordId
          ? _value.questionWordId
          : questionWordId // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedAnswer: null == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswerText: null == correctAnswerText
          ? _value.correctAnswerText
          : correctAnswerText // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResultModelImplCopyWith<$Res>
    implements $QuizResultModelCopyWith<$Res> {
  factory _$$QuizResultModelImplCopyWith(_$QuizResultModelImpl value,
          $Res Function(_$QuizResultModelImpl) then) =
      __$$QuizResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String resultId,
      String userId,
      DateTime quizDate,
      String questionWordId,
      bool correctAnswer,
      String selectedAnswer,
      String correctAnswerText,
      DateTime completedAt});
}

/// @nodoc
class __$$QuizResultModelImplCopyWithImpl<$Res>
    extends _$QuizResultModelCopyWithImpl<$Res, _$QuizResultModelImpl>
    implements _$$QuizResultModelImplCopyWith<$Res> {
  __$$QuizResultModelImplCopyWithImpl(
      _$QuizResultModelImpl _value, $Res Function(_$QuizResultModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultId = null,
    Object? userId = null,
    Object? quizDate = null,
    Object? questionWordId = null,
    Object? correctAnswer = null,
    Object? selectedAnswer = null,
    Object? correctAnswerText = null,
    Object? completedAt = null,
  }) {
    return _then(_$QuizResultModelImpl(
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quizDate: null == quizDate
          ? _value.quizDate
          : quizDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      questionWordId: null == questionWordId
          ? _value.questionWordId
          : questionWordId // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedAnswer: null == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswerText: null == correctAnswerText
          ? _value.correctAnswerText
          : correctAnswerText // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: null == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResultModelImpl implements _QuizResultModel {
  const _$QuizResultModelImpl(
      {required this.resultId,
      required this.userId,
      required this.quizDate,
      required this.questionWordId,
      required this.correctAnswer,
      required this.selectedAnswer,
      required this.correctAnswerText,
      required this.completedAt});

  factory _$QuizResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultModelImplFromJson(json);

  @override
  final String resultId;
  @override
  final String userId;
  @override
  final DateTime quizDate;
  @override
  final String questionWordId;
  @override
  final bool correctAnswer;
  @override
  final String selectedAnswer;
  @override
  final String correctAnswerText;
  @override
  final DateTime completedAt;

  @override
  String toString() {
    return 'QuizResultModel(resultId: $resultId, userId: $userId, quizDate: $quizDate, questionWordId: $questionWordId, correctAnswer: $correctAnswer, selectedAnswer: $selectedAnswer, correctAnswerText: $correctAnswerText, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultModelImpl &&
            (identical(other.resultId, resultId) ||
                other.resultId == resultId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quizDate, quizDate) ||
                other.quizDate == quizDate) &&
            (identical(other.questionWordId, questionWordId) ||
                other.questionWordId == questionWordId) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer) &&
            (identical(other.correctAnswerText, correctAnswerText) ||
                other.correctAnswerText == correctAnswerText) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      resultId,
      userId,
      quizDate,
      questionWordId,
      correctAnswer,
      selectedAnswer,
      correctAnswerText,
      completedAt);

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultModelImplCopyWith<_$QuizResultModelImpl> get copyWith =>
      __$$QuizResultModelImplCopyWithImpl<_$QuizResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultModelImplToJson(
      this,
    );
  }
}

abstract class _QuizResultModel implements QuizResultModel {
  const factory _QuizResultModel(
      {required final String resultId,
      required final String userId,
      required final DateTime quizDate,
      required final String questionWordId,
      required final bool correctAnswer,
      required final String selectedAnswer,
      required final String correctAnswerText,
      required final DateTime completedAt}) = _$QuizResultModelImpl;

  factory _QuizResultModel.fromJson(Map<String, dynamic> json) =
      _$QuizResultModelImpl.fromJson;

  @override
  String get resultId;
  @override
  String get userId;
  @override
  DateTime get quizDate;
  @override
  String get questionWordId;
  @override
  bool get correctAnswer;
  @override
  String get selectedAnswer;
  @override
  String get correctAnswerText;
  @override
  DateTime get completedAt;

  /// Create a copy of QuizResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultModelImplCopyWith<_$QuizResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
