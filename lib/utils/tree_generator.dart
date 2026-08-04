import 'package:kotoba_e/models/tree_node.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/services/word_index.dart';

class TreeGenerator {
  final WordIndex index;

  TreeGenerator(this.index);

  /// 単語追加時にツリーを生成・更新する
  WordTree generateTree(
    List<WordModel> viewedWords,
    String userId,
  ) {
    final totalWords = viewedWords.length;
    final nodes = <TreeNode>[];

    // ルートノードを作成（最初に見た単語）
    if (viewedWords.isNotEmpty) {
      final rootWord = viewedWords.first;
      final rootNode = _createNodeWithConnections(rootWord, 0, viewedWords);
      nodes.add(rootNode);

      // 子ノードを作成（漢字つながりで関連する単語）
      _addChildNodes(rootNode, viewedWords, nodes, depth: 1);
    }

    final level = TreeLevel.fromWordCount(totalWords);

    return WordTree(
      userId: userId,
      totalWords: totalWords,
      createdAt: DateTime.now(),
      nodes: nodes,
      treeLevelUnlocked: level.level,
      lastUpdated: DateTime.now(),
    );
  }

  /// 単語をノードに変換（関連ワード情報を含む）
  TreeNode _createNodeWithConnections(
    WordModel word,
    int depth,
    List<WordModel> allWords,
  ) {
    // 単語の漢字を抽出
    final kanji = _extractKanji(word.wordName);

    // 同じ漢字を含む関連単語を探す
    final connectedWords = <String>[];
    for (final relatedWord in allWords) {
      if (relatedWord.wordId != word.wordId) {
        final relatedKanji = _extractKanji(relatedWord.wordName);
        if (kanji.any((k) => relatedKanji.contains(k))) {
          connectedWords.add(relatedWord.wordId);
        }
      }
    }

    return TreeNode(
      wordId: word.wordId,
      wordName: word.wordName,
      depth: depth,
      addedAt: DateTime.now(),
      connectedKanji: kanji,
      childWordIds: connectedWords.take(3).toList(), // 最大3つまで
    );
  }

  /// 子ノードを再帰的に追加
  void _addChildNodes(
    TreeNode parent,
    List<WordModel> allWords,
    List<TreeNode> nodes, {
    required int depth,
    int maxDepth = 3,
  }) {
    if (depth > maxDepth || parent.childWordIds.isEmpty) return;

    for (final childWordId in parent.childWordIds) {
      try {
        final childWord = allWords.firstWhere(
          (w) => w.wordId == childWordId,
        );

        final childNode = _createNodeWithConnections(
          childWord,
          depth,
          allWords,
        );
        nodes.add(childNode);

        // さらに子ノードを追加（再帰）
        _addChildNodes(childNode, allWords, nodes, depth: depth + 1);
      } catch (e) {
        // 子ワードが見つからない場合はスキップ
        continue;
      }
    }
  }

  /// 単語から漢字を抽出
  List<String> _extractKanji(String text) {
    final kanji = <String>[];
    for (final rune in text.runes) {
      // CJK統一漢字の範囲: 0x4E00～0x9FFF
      if (rune >= 0x4E00 && rune <= 0x9FFF) {
        kanji.add(String.fromCharCode(rune));
      }
    }
    return kanji;
  }

  /// ツリーレベルに応じた見た目パラメータを返す
  TreeLevelStyle getStyleForLevel(TreeLevel level) {
    return TreeLevelStyle(
      level: level,
      nodeRadius: 30 + (level.level * 5).toDouble(),
      branchWidth: 2 + (level.level * 0.5),
      animationDuration: Duration(milliseconds: 800 + (level.level * 200)),
    );
  }
}

/// ツリーレベルの描画スタイル
class TreeLevelStyle {
  final TreeLevel level;
  final double nodeRadius;
  final double branchWidth;
  final Duration animationDuration;

  TreeLevelStyle({
    required this.level,
    required this.nodeRadius,
    required this.branchWidth,
    required this.animationDuration,
  });
}
