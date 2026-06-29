import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_queue_model.freezed.dart';
part 'quiz_queue_model.g.dart';

// 事前計算された今日のクイズキュー
@freezed
class QuizQueueModel with _$QuizQueueModel {
  const factory QuizQueueModel({
    required String queueId,
    required String date, // YYYY-MM-DD
    required String userId,
    required String wordId,
    required String wordName,
    required int questionIndex,
    required DateTime createdAt,
  }) = _QuizQueueModel;

  factory QuizQueueModel.fromJson(Map<String, dynamic> json) =>
      _$QuizQueueModelFromJson(json);
}

// クイズ問題（UI表示用）
@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String wordId,
    required String wordName,
    required String question,
    required List<String> options,
    required int correctIndex,
    required int questionNumber,
    required int totalQuestions,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}

// クイズ回答結果
@freezed
class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({
    required String wordId,
    required bool isCorrect,
    required String explanation,
    required DateTime nextReviewDate,
    required String newDifficulty,
  }) = _QuizAnswer;

  factory QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerFromJson(json);
}
