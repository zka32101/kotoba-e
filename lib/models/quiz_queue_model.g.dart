// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_queue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizQueueModelImpl _$$QuizQueueModelImplFromJson(Map<String, dynamic> json) =>
    _$QuizQueueModelImpl(
      queueId: json['queueId'] as String,
      date: json['date'] as String,
      userId: json['userId'] as String,
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      questionIndex: (json['questionIndex'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$QuizQueueModelImplToJson(
        _$QuizQueueModelImpl instance) =>
    <String, dynamic>{
      'queueId': instance.queueId,
      'date': instance.date,
      'userId': instance.userId,
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'questionIndex': instance.questionIndex,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$QuizQuestionImpl _$$QuizQuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuizQuestionImpl(
      wordId: json['wordId'] as String,
      wordName: json['wordName'] as String,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      correctIndex: (json['correctIndex'] as num).toInt(),
      questionNumber: (json['questionNumber'] as num).toInt(),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
    );

Map<String, dynamic> _$$QuizQuestionImplToJson(_$QuizQuestionImpl instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'wordName': instance.wordName,
      'question': instance.question,
      'options': instance.options,
      'correctIndex': instance.correctIndex,
      'questionNumber': instance.questionNumber,
      'totalQuestions': instance.totalQuestions,
    };

_$QuizAnswerImpl _$$QuizAnswerImplFromJson(Map<String, dynamic> json) =>
    _$QuizAnswerImpl(
      wordId: json['wordId'] as String,
      isCorrect: json['isCorrect'] as bool,
      explanation: json['explanation'] as String,
      nextReviewDate: DateTime.parse(json['nextReviewDate'] as String),
      newDifficulty: json['newDifficulty'] as String,
    );

Map<String, dynamic> _$$QuizAnswerImplToJson(_$QuizAnswerImpl instance) =>
    <String, dynamic>{
      'wordId': instance.wordId,
      'isCorrect': instance.isCorrect,
      'explanation': instance.explanation,
      'nextReviewDate': instance.nextReviewDate.toIso8601String(),
      'newDifficulty': instance.newDifficulty,
    };
