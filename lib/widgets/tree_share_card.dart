import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:gal/gal.dart';
import 'package:share_plus/share_plus.dart';
import 'package:kotoba_e/models/tree_node.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/widgets/tree_animation.dart';

class TreeShareCard extends StatefulWidget {
  final WordTree tree;
  final TreeLevel level;
  final int wordsUntilNext;

  const TreeShareCard({
    Key? key,
    required this.tree,
    required this.level,
    required this.wordsUntilNext,
  }) : super(key: key);

  @override
  State<TreeShareCard> createState() => _TreeShareCardState();
}

class _TreeShareCardState extends State<TreeShareCard> {
  final _screenshotController = ScreenshotController();
  bool _isSharing = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ツリーをシェア',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Screenshot(
              controller: _screenshotController,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppTheme.primary.withOpacity(0.8),
                      AppTheme.secondary.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        treeLevelImagePath(widget.level),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'ことばの木 Lv.${widget.level.level}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.tree.totalWords}語学習中',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (widget.wordsUntilNext > 0) ...[
                      const SizedBox(height: 12),
                      Text(
                        'あと${widget.wordsUntilNext}語で成長します',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        '#ことばえ #ことばの木',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _isSharing ? null : _shareToSocial,
                    icon: const Icon(Icons.share),
                    label: Text(_isSharing ? 'シェア中...' : 'SNSでシェア'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _isSharing ? null : _saveToGallery,
                    icon: const Icon(Icons.download),
                    label: Text(_isSharing ? '保存中...' : '画像を保存'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppTheme.primary),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _shareToSocial() async {
    setState(() => _isSharing = true);
    try {
      final image = await _screenshotController.capture(
        delay: const Duration(milliseconds: 100),
      );

      if (image != null) {
        await Share.shareXFiles(
          [XFile.fromData(image, mimeType: 'image/png', name: 'kotoba_tree.png')],
          text: 'ことばの木がレベル${widget.level.level}に成長しました！'
              '\n${widget.tree.totalWords}語学習中\n#ことばえ #ことばの木',
        );
      }
    } catch (e) {
      _showError('シェアに失敗しました: $e');
    } finally {
      if (mounted) {
        setState(() => _isSharing = false);
      }
    }
  }

  Future<void> _saveToGallery() async {
    setState(() => _isSharing = true);
    try {
      final image = await _screenshotController.capture(
        delay: const Duration(milliseconds: 100),
      );

      if (image != null) {
        await Gal.putImageBytes(image, name: 'kotoba_tree_${DateTime.now().millisecondsSinceEpoch}');
        _showSuccess('画像をギャラリーに保存しました');
      }
    } catch (e) {
      _showError('保存に失敗しました: $e');
    } finally {
      if (mounted) {
        setState(() => _isSharing = false);
      }
    }
  }


  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
