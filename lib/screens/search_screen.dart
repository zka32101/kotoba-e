import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/providers/word_provider.dart';
import 'package:kotoba_e/providers/auth_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(searchWordProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final language = ref.watch(selectedLanguageProvider);
    final gradeLevel = ref.watch(gradeLevelProvider);
    final wordGroups = ref.watch(wordGroupsProvider);

    // 検索結果を取得
    final searchResults = ref.watch(searchResultsProvider);

    // カテゴリでフィルター
    final filteredResults = searchResults.whenData((words) {
      if (selectedCategory == null) return words;
      return words
          .where(
            (w) => ref.watch(wordCategoryProvider(w.wordId)).value == selectedCategory,
          )
          .toList();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('単語検索'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // ── 検索フィールド ────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: TextField(
              controller: _controller,
              autofocus: true,
              onChanged: (v) => ref.read(searchWordProvider.notifier).state = v,
              decoration: InputDecoration(
                hintText: '単語・ひらがなで検索...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          ref.read(searchWordProvider.notifier).state = '';
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ── カテゴリフィルタータブ ────────────────
          wordGroups.when(
            loading: () => const SizedBox(height: 40),
            error: (_, __) => const SizedBox.shrink(),
            data: (groups) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  // 「すべて」ボタン
                  _CategoryChip(
                    label: 'すべて',
                    emoji: '📚',
                    isSelected: selectedCategory == null,
                    onTap: () =>
                        ref.read(selectedCategoryProvider.notifier).state = null,
                  ),
                  // 各カテゴリ
                  ...groups.map(
                    (g) => _CategoryChip(
                      label: g.label,
                      emoji: g.emoji,
                      isSelected: selectedCategory == g.id,
                      onTap: () =>
                          ref.read(selectedCategoryProvider.notifier).state =
                              g.id,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ── 結果リスト ──────────────────────────
          Expanded(
            child: filteredResults.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('エラー: $e')),
              data: (words) {
                if (words.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.search_off,
                            size: 64, color: AppTheme.textSecondary),
                        const SizedBox(height: 16),
                        Text(
                          searchQuery.isEmpty
                              ? 'カテゴリから検索してください'
                              : '「$searchQuery」は見つかりませんでした',
                          style: AppTheme.bodyMedium
                              .copyWith(color: AppTheme.textSecondary),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: words.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _WordTile(
                    word: words[i],
                    language: language,
                    gradeLevel: gradeLevel,
                    onTap: () => context.go('/home/word/${words[i].wordId}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// カテゴリチップ
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _CategoryChip extends StatelessWidget {
  final String label;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primary : AppTheme.surface,
            border: Border.all(
              color: isSelected ? AppTheme.primary : AppTheme.divider,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color:
                      isSelected ? Colors.white : AppTheme.textSecondary,
                  fontFamily: 'NotoSansJP',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 単語タイル
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _WordTile extends StatelessWidget {
  final WordModel word;
  final String language;
  final int gradeLevel;
  final VoidCallback onTap;

  const _WordTile({
    required this.word,
    required this.language,
    required this.gradeLevel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final description = word.getDescription(gradeLevel, language);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          boxShadow: AppTheme.softShadow,
        ),
        child: Row(
          children: [
            // イラストプレースホルダー
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: _hexToColor(word.illustrationPlaceholder),
                borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
              ),
              alignment: Alignment.center,
              child: Text(
                word.wordName.substring(0, 1),
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(word.wordName, style: AppTheme.heading3),
                      const SizedBox(width: 8),
                      Text(word.furigana, style: AppTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
          ],
        ),
      ),
    );
  }

  Color _hexToColor(String hex) {
    final h = hex.replaceAll('#', '');
    return Color(int.parse('FF$h', radix: 16));
  }
}
