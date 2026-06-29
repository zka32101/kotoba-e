import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_result_model.freezed.dart';
part 'quiz_result_model.g.dart';

@freezed
class QuizResultModel with _$QuizResultModel {
  const factory QuizResultModel({
    required String resultId,
    required String userId,
    required DateTime quizDate,
    required String questionWordId,
    required bool correctAnswer,
    required String selectedAnswer,
    required String correctAnswerText,
    required DateTime completedAt,
  }) = _QuizResultModel;

  factory QuizResultModel.fromJson(Map<String, dynamic> json) =>
      _$QuizResultModelFromJson(json);
}
