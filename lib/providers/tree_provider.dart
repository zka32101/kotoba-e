import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/models/tree_node.dart';
import 'package:kotoba_e/providers/word_provider.dart';
import 'package:kotoba_e/utils/tree_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// ツリーの再生成トリガー
final treeRefreshProvider = StateProvider<int>((ref) => 0);

/// ツリー生成エンジン
final treeGeneratorProvider = FutureProvider<TreeGenerator>((ref) async {
  final index = await ref.watch(wordIndexProvider.future);
  return TreeGenerator(index);
});

/// ユーザーのツリー（再生成頻度は低い）
final userTreeProvider = FutureProvider<WordTree>((ref) async {
  final generator = await ref.watch(treeGeneratorProvider.future);
  final viewedWords = await ref.watch(recentWordsProvider.future);

  // トリガーを監視して再生成
  ref.watch(treeRefreshProvider);

  if (viewedWords.isEmpty) {
    return WordTree(
      userId: 'default',
      totalWords: 0,
      createdAt: DateTime.now(),
      nodes: [],
      treeLevelUnlocked: 1,
    );
  }

  return generator.generateTree(viewedWords, 'user-id');
});

/// 現在のツリーレベル
final treeCurrentLevelProvider = FutureProvider<TreeLevel>((ref) async {
  final tree = await ref.watch(userTreeProvider.future);
  return TreeLevel.fromWordCount(tree.totalWords);
});

/// ツリーの成長進捗（0.0～1.0）
final treeProgressProvider = FutureProvider<double>((ref) async {
  final tree = await ref.watch(userTreeProvider.future);
  final currentLevel = TreeLevel.fromWordCount(tree.totalWords);

  // 次のレベルまでの進捗を計算
  final currentLevelMin = _getLevelMinWords(currentLevel);
  final nextLevelIndex = (currentLevel.index + 1).clamp(0, TreeLevel.values.length - 1);
  final nextLevelMin = _getLevelMinWords(TreeLevel.values[nextLevelIndex]);

  if (nextLevelMin <= currentLevelMin) return 1.0;

  return (tree.totalWords - currentLevelMin) /
         (nextLevelMin - currentLevelMin);
});

/// 条件を満たしたアンロック状態
final treeUnlockAchievementProvider = FutureProvider<TreeAchievement>((ref) async {
  final tree = await ref.watch(userTreeProvider.future);
  final level = TreeLevel.fromWordCount(tree.totalWords);

  return TreeAchievement(
    totalWords: tree.totalWords,
    currentLevel: level,
    seedUnlocked: tree.totalWords >= 1,
    sproutUnlocked: tree.totalWords >= 11,
    leafUnlocked: tree.totalWords >= 51,
    flowerUnlocked: tree.totalWords >= 101,
    fruitUnlocked: tree.totalWords >= 501,
    fullTreeUnlocked: tree.totalWords >= 1001,
  );
});

/// ツリーをSharePrefsに保存
Future<void> saveTreeSnapshot(SharedPreferences prefs, WordTree tree) async {
  final json = tree.toJson();
  await prefs.setString('word_tree_snapshot', json.toString());
  await prefs.setInt('tree_total_words', tree.totalWords);
  await prefs.setInt('tree_level', tree.treeLevelUnlocked);
}

/// ツリースナップショットを取得（オフライン用）
Future<WordTree?> loadTreeSnapshot(SharedPreferences prefs) async {
  final json = prefs.getString('word_tree_snapshot');
  if (json == null) return null;
  try {
    return WordTree.fromJson(Map<String, dynamic>.from(json as Map));
  } catch (e) {
    return null;
  }
}

/// ヘルパー関数
int _getLevelMinWords(TreeLevel level) {
  switch (level) {
    case TreeLevel.seed:
      return 1;
    case TreeLevel.sprout:
      return 11;
    case TreeLevel.leaf:
      return 51;
    case TreeLevel.flower:
      return 101;
    case TreeLevel.fruit:
      return 501;
    case TreeLevel.full:
      return 1001;
  }
}

/// ツリーのアンロック状態
class TreeAchievement {
  final int totalWords;
  final TreeLevel currentLevel;
  final bool seedUnlocked;
  final bool sproutUnlocked;
  final bool leafUnlocked;
  final bool flowerUnlocked;
  final bool fruitUnlocked;
  final bool fullTreeUnlocked;

  TreeAchievement({
    required this.totalWords,
    required this.currentLevel,
    required this.seedUnlocked,
    required this.sproutUnlocked,
    required this.leafUnlocked,
    required this.flowerUnlocked,
    required this.fruitUnlocked,
    required this.fullTreeUnlocked,
  });

  /// アンロックされたレベルの総数
  int get unlockedCount => [
    seedUnlocked,
    sproutUnlocked,
    leafUnlocked,
    flowerUnlocked,
    fruitUnlocked,
    fullTreeUnlocked,
  ].where((b) => b).length;

  /// 次のアンロックまでの単語数
  int get wordsUntilNextLevel {
    final nextLevelIndex = (currentLevel.index + 1).clamp(0, TreeLevel.values.length - 1);
    final nextMin = _getLevelMinWords(TreeLevel.values[nextLevelIndex]);
    return (nextMin - totalWords).clamp(0, double.infinity).toInt();
  }
}
