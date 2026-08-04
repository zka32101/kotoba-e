import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_node.freezed.dart';
part 'tree_node.g.dart';

@freezed
class TreeNode with _$TreeNode {
  const factory TreeNode({
    required String wordId,
    required String wordName,
    required int depth,
    required DateTime addedAt,
    @Default([]) List<String> childWordIds,
    @Default([]) List<String> connectedKanji,
  }) = _TreeNode;

  factory TreeNode.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeFromJson(json);
}

@freezed
class WordTree with _$WordTree {
  const factory WordTree({
    required String userId,
    required int totalWords,
    required DateTime createdAt,
    @Default([]) List<TreeNode> nodes,
    required int treeLevelUnlocked,
    DateTime? lastUpdated,
  }) = _WordTree;

  factory WordTree.fromJson(Map<String, dynamic> json) =>
      _$WordTreeFromJson(json);
}

/// ツリーレベル定義
enum TreeLevel {
  seed(1, '種', '1-10語', '0xFFF3CD'),      // 種 - 発芽前
  sprout(2, '芽', '11-50語', '0xC3E6CB'),   // 芽 - 成長開始
  leaf(3, '葉', '51-100語', '0x90EE90'),    // 葉 - 枝葉が茂る
  flower(4, '花', '101-500語', '0xFFB6C1'), // 花 - 開花
  fruit(5, '実', '501-1000語', '0xFF6347'), // 実 - 実がなる
  full(6, '大樹', '1001+語', '0x8B4513');   // 大樹 - 完全に成長

  final int level;
  final String name;
  final String range;
  final String color;

  const TreeLevel(this.level, this.name, this.range, this.color);

  static TreeLevel fromWordCount(int count) {
    if (count <= 10) return TreeLevel.seed;
    if (count <= 50) return TreeLevel.sprout;
    if (count <= 100) return TreeLevel.leaf;
    if (count <= 500) return TreeLevel.flower;
    if (count <= 1000) return TreeLevel.fruit;
    return TreeLevel.full;
  }
}
