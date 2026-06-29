import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionsService {
  // asia-northeast1（東京）リージョンでデプロイ想定
  final _fn = FirebaseFunctions.instanceFor(region: 'asia-northeast1');

  // ── 今日のクイズキューを生成 ────────────────────────────────
  // SRS スケジュール（復習期限が来た単語）+ 未学習の新規単語を合計 count 件返す。
  Future<List<Map<String, dynamic>>> generateQuizQueue({
    required String userId,
    int count = 10,
  }) async {
    try {
      final result = await _fn
          .httpsCallable('generateQuizQueue')
          .call({'userId': userId, 'count': count});
      final data = result.data as Map<Object?, Object?>;
      final queue = data['queue'] as List<Object?>? ?? [];
      return queue
          .whereType<Map<Object?, Object?>>()
          .map((e) => e.map((k, v) => MapEntry(k.toString(), v)))
          .toList();
    } on FirebaseFunctionsException catch (e) {
      throw Exception('generateQuizQueue error: ${e.code} ${e.message}');
    }
  }

  // ── バッジ解除チェック（＋ストリーク取得）──────────────────
  // ユーザーの学習実績を判定し、条件を満たすバッジを解除する。
  // 戻り値: {newAchievements: List<String>, streak: int}
  Future<Map<String, dynamic>> checkAchievements({
    required String userId,
  }) async {
    try {
      final result = await _fn
          .httpsCallable('checkAchievements')
          .call({'userId': userId});
      final data = result.data as Map<Object?, Object?>;
      return data.map((k, v) => MapEntry(k.toString(), v));
    } on FirebaseFunctionsException catch (e) {
      throw Exception('checkAchievements error: ${e.code} ${e.message}');
    }
  }

  // ── ストリーク更新 ──────────────────────────────────────────
  // 当日初回の学習時に呼び出す。前日比較でストリークを加算 or リセット。
  Future<Map<String, dynamic>> updateStreak({
    required String userId,
  }) async {
    try {
      final result = await _fn
          .httpsCallable('updateStreak')
          .call({'userId': userId});
      final data = result.data as Map<Object?, Object?>;
      return data.map((k, v) => MapEntry(k.toString(), v));
    } on FirebaseFunctionsException catch (e) {
      throw Exception('updateStreak error: ${e.code} ${e.message}');
    }
  }
}

final cloudFunctionsService = CloudFunctionsService();
