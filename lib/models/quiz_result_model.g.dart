// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizResultModelImpl _$$QuizResultModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuizResultModelImpl(
      resultId: json['resultId'] as String,
      userId: json['userId'] as String,
      quizDate: DateTime.parse(json['quizDate'] as String),
      questionWordId: json['questionWordId'] as String,
      correctAnswer: json['correctAnswer'] as bool,
      selectedAnswer: json['selectedAnswer'] as String,
      correctAnswerText: json['correctAnswerText'] as String,
      completedAt: DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$QuizResultModelImplToJson(
        _$QuizResultModelImpl instance) =>
    <String, dynamic>{
      'resultId': instance.resultId,
      'userId': instance.userId,
      'quizDate': instance.quizDate.toIso8601String(),
      'questionWordId': instance.questionWordId,
      'correctAnswer': instance.correctAnswer,
      'selectedAnswer': instance.selectedAnswer,
      'correctAnswerText': instance.correctAnswerText,
      'completedAt': instance.completedAt.toIso8601String(),
    };
