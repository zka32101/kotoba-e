// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_queue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizQueueModel _$QuizQueueModelFromJson(Map<String, dynamic> json) =>
    _QuizQueueModel(
      queueId: json['queueId'] as String,
      date: json['date'] as String,
      userId: json['userId'] as String,
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      questionIndex: (json['questionIndex'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$QuizQueueModelToJson(_QuizQueueModel instance) =>
    <String, dynamic>{
      'queueId': instance.queueId,
      'date': instance.date,
      'userId': instance.userId,
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'questionIndex': instance.questionIndex,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) =>
    _QuizQuestion(
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctIndex: (json['correctIndex'] as num).toInt(),
      questionNumber: (json['questionNumber'] as num).toInt(),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
    );

Map<String, dynamic> _$QuizQuestionToJson(_QuizQuestion instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'question': instance.question,
      'options': instance.options,
      'correctIndex': instance.correctIndex,
      'questionNumber': instance.questionNumber,
      'totalQuestions': instance.totalQuestions,
    };

_QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) => _QuizAnswer(
  wordId: json['wordId'] as String,
  isCorrect: json['isCorrect'] as bool,
  explanation: json['explanation'] as String,
  nextReviewDate: DateTime.parse(json['nextReviewDate'] as String),
  newDifficulty: json['newDifficulty'] as String,
);

Map<String, dynamic> _$QuizAnswerToJson(_QuizAnswer instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'isCorrect': instance.isCorrect,
      'explanation': instance.explanation,
      'nextReviewDate': instance.nextReviewDate.toIso8601String(),
      'newDifficulty': instance.newDifficulty,
    };
