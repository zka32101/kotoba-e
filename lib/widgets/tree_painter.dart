import 'package:flutter/material.dart';
import 'package:kotoba_e/models/tree_node.dart';
import 'package:kotoba_e/config/theme.dart';

class TreePainter extends CustomPainter {
  final WordTree tree;
  final TreeLevel level;
  final int selectedWordIndex;

  TreePainter({
    required this.tree,
    required this.level,
    this.selectedWordIndex = -1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (tree.nodes.isEmpty) return;

    // 背景グラデーション
    _drawBackground(canvas, size);

    // ツリーを描画
    _drawTree(canvas, size);
  }

  void _drawBackground(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.blue.withOpacity(0.05),
        Colors.green.withOpacity(0.05),
      ],
    );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      ),
    );
  }

  void _drawTree(Canvas canvas, Size size) {
    final rootNode = tree.nodes.first;
    final centerX = size.width / 2;
    final startY = 50.0;

    // ルートノード（樹形図の頂点）
    _drawNode(canvas, rootNode, centerX, startY, selectedWordIndex == 0);

    // 子ノードをツリー構造で描画
    _drawChildren(
      canvas,
      rootNode,
      centerX,
      startY + 80,
      size.width / 4,
    );
  }

  void _drawChildren(
    Canvas canvas,
    TreeNode parent,
    double parentX,
    double y,
    double horizontalSpacing,
  ) {
    if (parent.childWordIds.isEmpty || y > 500) return;

    final childCount = parent.childWordIds.length;
    final startX = parentX - (horizontalSpacing * childCount / 2);

    for (int i = 0; i < childCount; i++) {
      final childX = startX + (i * horizontalSpacing);
      final childNodeIndex = tree.nodes.indexWhere(
        (n) => n.wordId == parent.childWordIds[i],
      );

      if (childNodeIndex != -1) {
        final childNode = tree.nodes[childNodeIndex];

        // 親から子への枝を描画
        _drawBranch(canvas, parentX, y - 80, childX, y);

        // ノードを描画
        _drawNode(
          canvas,
          childNode,
          childX,
          y,
          selectedWordIndex == childNodeIndex,
        );

        // さらに子ノードを描画（再帰）
        _drawChildren(
          canvas,
          childNode,
          childX,
          y + 70,
          horizontalSpacing / 2,
        );
      }
    }
  }

  void _drawNode(
    Canvas canvas,
    TreeNode node,
    double x,
    double y,
    bool isSelected,
  ) {
    final radius = 25.0;
    final nodeColor = _getNodeColor(node.depth);

    // ノード背景
    canvas.drawCircle(
      Offset(x, y),
      radius,
      Paint()
        ..color = nodeColor
        ..style = PaintingStyle.fill,
    );

    // ノード枠線（選択時は太くなる）
    canvas.drawCircle(
      Offset(x, y),
      radius,
      Paint()
        ..color = isSelected ? AppTheme.accent : Colors.grey.shade400
        ..strokeWidth = isSelected ? 3 : 1
        ..style = PaintingStyle.stroke,
    );

    // テキスト（単語）
    _drawNodeText(canvas, node.wordName, x, y);
  }

  void _drawBranch(
    Canvas canvas,
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    canvas.drawLine(
      Offset(x1, y1),
      Offset(x2, y2),
      Paint()
        ..color = Colors.grey.withOpacity(0.4)
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawNodeText(Canvas canvas, String text, double x, double y) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text.length > 6 ? '${text.substring(0, 6)}...' : text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          fontFamily: 'NotoSansJP',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(x - textPainter.width / 2, y - textPainter.height / 2),
    );
  }

  Color _getNodeColor(int depth) {
    const colors = [
      Color(0xFFFFC107), // 根：黄色
      Color(0xFF66BB6A), // 深さ1：緑
      Color(0xFF42A5F5), // 深さ2：青
      Color(0xFFAB47BC), // 深さ3：紫
    ];
    return colors[depth.clamp(0, colors.length - 1)];
  }

  @override
  bool shouldRepaint(TreePainter oldDelegate) {
    return oldDelegate.tree != tree ||
        oldDelegate.level != level ||
        oldDelegate.selectedWordIndex != selectedWordIndex;
  }
}
