// dart run tool/generate_words_json.dart
// mock_words.dart の内容を assets/data/words.json に書き出す
import 'dart:convert';
import 'dart:io';
import 'package:kotoba_e/data/mock_words.dart';

void main() {
  final words = mockWords.map((w) {
    final j = {
      'wordId': w.wordId,
      'wordName': w.wordName,
      'furigana': w.furigana,
      'partsOfSpeech': w.partsOfSpeech,
      'descriptions': w.descriptions,
      'nuanceExplanations': w.nuanceExplanations.map(
        (k, v) => MapEntry(k, {
          'background': v.background,
          'usage': v.usage,
          'contrast': v.contrast,
        }),
      ),
      'illustrationUrl': w.illustrationUrl,
      'illustrationPlaceholder': w.illustrationPlaceholder,
      'frequency': w.frequency,
      'createdAt': w.createdAt.toIso8601String(),
      'updatedAt': w.updatedAt.toIso8601String(),
    };
    return j;
  }).toList();

  const encoder = JsonEncoder.withIndent('  ');
  final json = encoder.convert(words);
  File('assets/data/words.json').writeAsStringSync(json);
  print('✓ Generated ${words.length} words → assets/data/words.json');
}
