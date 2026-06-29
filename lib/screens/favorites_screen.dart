import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/models/bookmark_model.dart';
import 'package:kotoba_e/providers/bookmark_provider.dart';
import 'package:kotoba_e/providers/srs_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dueIds = ref.watch(dueTodayWordIdsProvider).toSet();

    final tabItems = [
      (label: 'すべて', status: 'all'),
      (label: '今日の復習', status: 'due'),
      (label: '学習中', status: 'reviewing'),
      (label: '習得済み', status: 'mastered'),
    ];

    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('マイ単語'),
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            labelColor: AppTheme.primary,
            unselectedLabelColor: AppTheme.textSecondary,
            indicatorColor: AppTheme.primary,
            tabs: tabItems.map((t) => Tab(text: t.label)).toList(),
          ),
        ),
        body: TabBarView(
          children: tabItems.map((t) {
            final filtered = ref.watch(bookmarksByStatusProvider(t.status));
            return _BookmarkList(
              bookmarks: filtered,
              dueIds: dueIds,
              onTap: (wordId) => context.go('/home/word/$wordId'),
              onRemove: (wordId) => ref.read(bookmarksProvider.notifier).removeBookmark(wordId),
              onStatusChange: (wordId, status) =>
                  ref.read(bookmarksProvider.notifier).updateStatus(wordId, status),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _BookmarkList extends StatelessWidget {
  final List<BookmarkModel> bookmarks;
  final Set<String> dueIds;
  final ValueChanged<String> onTap;
  final ValueChanged<String> onRemove;
  final void Function(String wordId, String status) onStatusChange;

  const _BookmarkList({
    required this.bookmarks,
    required this.dueIds,
    required this.onTap,
    required this.onRemove,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    if (bookmarks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 64, color: AppTheme.textSecondary.withValues(alpha: 0.5)),
            const SizedBox(height: 16),
            const Text('お気に入りがありません', style: AppTheme.heading3),
            const SizedBox(height: 8),
            const Text('単語詳細から追加してください', style: AppTheme.bodySmall),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: bookmarks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final bm = bookmarks[i];
        final isDue = dueIds.contains(bm.wordId);

        return Dismissible(
          key: Key(bm.bookmarkId),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: AppTheme.error,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (_) => onRemove(bm.wordId),
          child: GestureDetector(
            onTap: () => onTap(bm.wordId),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDue ? AppTheme.secondary.withValues(alpha: 0.5) : AppTheme.divider,
                  width: isDue ? 1.5 : 1,
                ),
              ),
              child: Row(
                children: [
                  // ステータスアイコン
                  _StatusDot(status: bm.status),
                  const SizedBox(width: 14),
                  // 単語情報
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(bm.wordName, style: AppTheme.heading3),
                            if (isDue) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppTheme.secondary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text('復習！', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '追加日: ${_formatDate(bm.bookmarkedAt)}',
                          style: AppTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  // ステータス変更メニュー
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, color: AppTheme.textSecondary),
                    onSelected: (status) => onStatusChange(bm.wordId, status),
                    itemBuilder: (_) => [
                      const PopupMenuItem(value: 'new', child: Text('新規')),
                      const PopupMenuItem(value: 'reviewing', child: Text('学習中')),
                      const PopupMenuItem(value: 'mastered', child: Text('習得済み')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')}';
  }
}

class _StatusDot extends StatelessWidget {
  final String status;
  const _StatusDot({required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, icon) = switch (status) {
      'mastered' => (AppTheme.success, Icons.check_circle),
      'reviewing' => (AppTheme.primary, Icons.access_time),
      _ => (AppTheme.textSecondary, Icons.radio_button_unchecked),
    };
    return Icon(icon, color: color, size: 22);
  }
}
