import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/models/bookmark_model.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/providers/auth_provider.dart';
import 'package:kotoba_e/providers/bookmark_provider.dart';
import 'package:kotoba_e/providers/srs_provider.dart';
import 'package:kotoba_e/providers/word_provider.dart';

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
        body: Column(
          children: [
            const _SuggestedRelatedWords(),
            Expanded(
              child: TabBarView(
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
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// おすすめの関連単語
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _SuggestedRelatedWords extends ConsumerWidget {
  const _SuggestedRelatedWords();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = ref.watch(suggestedRelatedWordsProvider);

    return suggestions.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (words) {
        if (words.isEmpty) return const SizedBox.shrink();
        final user = ref.watch(currentUserProvider);

        return Container(
          padding: const EdgeInsets.only(top: 12, bottom: 4),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppTheme.divider)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('おすすめの関連単語', style: AppTheme.bodySmall),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 78,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: words.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, i) {
                    final word = words[i];
                    return _SuggestedWordCard(
                      word: word,
                      onTap: () => context.go('/home/word/${word.wordId}'),
                      onAdd: () {
                        ref.read(bookmarksProvider.notifier).addBookmark(
                              userId: user?.userId ?? 'guest',
                              wordId: word.wordId,
                              wordName: word.wordName,
                            );
                        ref.read(srsProvider.notifier).initWord(word.wordId);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}

class _SuggestedWordCard extends StatelessWidget {
  final WordModel word;
  final VoidCallback onTap;
  final VoidCallback onAdd;

  const _SuggestedWordCard({
    required this.word,
    required this.onTap,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          border: Border.all(color: AppTheme.divider),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    word.wordName,
                    style: AppTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    word.furigana,
                    style: AppTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle, color: AppTheme.primary, size: 22),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: onAdd,
            ),
          ],
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
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => context.go('/home/search'),
              icon: const Icon(Icons.search),
              label: const Text('単語を探す'),
            ),
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
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (_) => onRemove(bm.wordId),
          child: GestureDetector(
            onTap: () => onTap(bm.wordId),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                border: isDue
                    ? Border.all(color: AppTheme.secondary.withValues(alpha: 0.5), width: 1.5)
                    : null,
                boxShadow: AppTheme.softShadow,
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
