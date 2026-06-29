import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kotoba_e/models/word_model.dart';

// コンパクトJSON → WordModel 変換
// words.json のフォーマット（v1 互換 + v2 拡張フィールド）:
// {
//   "wordId": "w153", "wordName": "電話", "furigana": "でんわ",
//   "partsOfSpeech": "noun",
//   "desc1": "...",  // 小1向け説明（必須）
//   "desc3": "...",  // 小3向け説明（省略可）
//   "desc6": "...",  // 小6向け説明（省略可）
//   "descEn": "...", // 英語説明（省略可）
//   "color": "#E3F2FD", "freq": 88,
//   // v2 拡張フィールド（すべて省略可）:
//   "cat": "technology",     // カテゴリ ID（省略時は WordIndex が自動分類）
//   "tags": ["daily"],       // 追加タグ
//   "example": "電話をかける。", // 用例文
//   "related": ["w154"]      // 関連語 wordId リスト
// }
class WordDataService {
  static Future<List<WordModel>> loadFromJson() async {
    try {
      final raw = await rootBundle.loadString('assets/data/words.json');
      final list = jsonDecode(raw) as List<dynamic>;
      return list.map((j) => _fromCompact(j as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  static WordModel _fromCompact(Map<String, dynamic> j) {
    final descriptions = <String, String>{};
    if (j['desc1'] != null) descriptions['grade1'] = j['desc1'] as String;
    if (j['desc2'] != null) descriptions['grade2'] = j['desc2'] as String;
    if (j['desc3'] != null) descriptions['grade3'] = j['desc3'] as String;
    if (j['desc4'] != null) descriptions['grade4'] = j['desc4'] as String;
    if (j['desc5'] != null) descriptions['grade5'] = j['desc5'] as String;
    if (j['desc6'] != null) descriptions['grade6'] = j['desc6'] as String;
    if (descriptions.isEmpty) descriptions['grade1'] = j['wordName'] as String;

    final nuance = <String, NuanceExplanation>{};
    if (j['descEn'] != null) {
      nuance['en'] = NuanceExplanation(
        background: j['descEn'] as String,
        usage: j['usageEn'] as String? ?? '',
        contrast: j['contrastEn'] as String? ?? '',
      );
    }

    return WordModel(
      wordId: j['wordId'] as String,
      wordName: j['wordName'] as String,
      furigana: j['furigana'] as String,
      partsOfSpeech: j['partsOfSpeech'] as String? ?? 'noun',
      descriptions: descriptions,
      nuanceExplanations: nuance,
      illustrationPlaceholder: j['color'] as String? ?? '#F5F5F5',
      frequency: j['freq'] as int? ?? 50,
      createdAt: DateTime(2026, 1, 1),
      updatedAt: DateTime(2026, 1, 1),
    );
  }
}
