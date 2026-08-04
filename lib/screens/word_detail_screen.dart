import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/providers/word_provider.dart';
import 'package:kotoba_e/providers/auth_provider.dart';
import 'package:kotoba_e/providers/bookmark_provider.dart';
import 'package:kotoba_e/providers/srs_provider.dart';

class WordDetailScreen extends ConsumerStatefulWidget {
  final String wordId;
  const WordDetailScreen({super.key, required this.wordId});

  @override
  ConsumerState<WordDetailScreen> createState() => _WordDetailScreenState();
}

class _WordDetailScreenState extends ConsumerState<WordDetailScreen> {
  @override
  void initState() {
    super.initState();
    // 閲覧履歴・コレクションに記録
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recordWordView(ref, widget.wordId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final wordId = widget.wordId;
    final wordAsync = ref.watch(wordDetailProvider(wordId));
    final gradeLevel = ref.watch(gradeLevelProvider);
    final language = ref.watch(selectedLanguageProvider);
    final isBookmarked = ref.watch(isBookmarkedProvider(wordId));
    final srsEntry = ref.watch(srsEntryProvider(wordId));
    final user = ref.watch(currentUserProvider);
    final relatedWords = ref.watch(relatedWordsProvider(wordId));

    return wordAsync.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('エラー: $e'))),
      data: (word) {
        if (word == null) {
          return const Scaffold(body: Center(child: Text('単語が見つかりません')));
        }
        return _WordDetailBody(
          word: word,
          gradeLevel: gradeLevel,
          language: language,
          isBookmarked: isBookmarked,
          srsEntry: srsEntry,
          relatedWords: relatedWords,
          onBookmarkToggle: () {
            if (isBookmarked) {
              ref.read(bookmarksProvider.notifier).removeBookmark(wordId);
            } else {
              ref.read(bookmarksProvider.notifier).addBookmark(
                userId: user?.userId ?? 'guest',
                wordId: wordId,
                wordName: word.wordName,
              );
              ref.read(srsProvider.notifier).initWord(wordId);
            }
          },
          onGradeLevelChange: (g) => ref.read(currentUserProvider.notifier).updateProfile(gradeLevel: g),
          onRelatedWordTap: (wId) => context.go('/home/word/$wId'),
        );
      },
    );
  }
}

class _WordDetailBody extends ConsumerWidget {
  final WordModel word;
  final int gradeLevel;
  final String language;
  final bool isBookmarked;
  final dynamic srsEntry;
  final AsyncValue<List<WordModel>> relatedWords;
  final VoidCallback onBookmarkToggle;
  final ValueChanged<int> onGradeLevelChange;
  final ValueChanged<String> onRelatedWordTap;

  const _WordDetailBody({
    required this.word,
    required this.gradeLevel,
    required this.language,
    required this.isBookmarked,
    required this.srsEntry,
    required this.relatedWords,
    required this.onBookmarkToggle,
    required this.onGradeLevelChange,
    required this.onRelatedWordTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final description = word.getDescription(gradeLevel, language);
    final nuance = word.nuanceExplanations[language == 'en' ? 'en' : 'ja'];

    // 単語名に含まれる漢字（重複なし）
    final kanjiList = word.wordName.runes
        .map((r) => String.fromCharCode(r))
        .where((c) {
          final code = c.runes.first;
          return code >= 0x4E00 && code <= 0x9FFF;
        })
        .toSet()
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(word.wordName),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(isBookmarked ? Icons.favorite : Icons.favorite_border,
                color: isBookmarked ? Colors.red : null),
            onPressed: onBookmarkToggle,
            tooltip: isBookmarked ? 'お気に入り解除' : 'お気に入り追加',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── イラストエリア ──
            _IllustrationArea(word: word),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── 単語ヘッダー ──
                  _WordHeader(word: word),
                  const SizedBox(height: 20),

                  // ── 学年切り替え（国内向け） ──
                  if (language == 'ja') ...[
                    _GradePicker(gradeLevel: gradeLevel, onChanged: onGradeLevelChange),
                    const SizedBox(height: 16),
                  ],

                  // ── 説明 ──
                  _SectionLabel(label: language == 'ja' ? '意味' : 'Meaning'),
                  const SizedBox(height: 8),
                  _DescriptionBox(text: description),
                  const SizedBox(height: 20),

                  // ── ニュアンス比較（海外向け） ──
                  if (nuance != null && language == 'en') ...[
                    const _SectionLabel(label: 'Cultural Background'),
                    const SizedBox(height: 8),
                    _NuanceBox(nuance: nuance),
                    const SizedBox(height: 20),
                  ],

                  // ── 関連語・類義語・対義語 ────────────
                  relatedWords.when(
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                    data: (related) {
                      if (related.isEmpty) return const SizedBox.shrink();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SectionLabel(label: '関連する言葉'),
                          const SizedBox(height: 12),
                          _RelatedWordsGrid(
                            words: related,
                            onTap: onRelatedWordTap,
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),

                  // ── 漢字つながり探索 ──────────────────
                  if (kanjiList.isNotEmpty) ...[
                    ...kanjiList.map((kanji) => _KanjiConnectionSection(
                          kanji: kanji,
                          currentWordId: word.wordId,
                          onWordTap: onRelatedWordTap,
                        )),
                  ],

                  // ── SRS 次回復習日 ──
                  if (srsEntry != null) ...[
                    _SrsInfo(nextReviewDate: srsEntry.nextReviewDate),
                    const SizedBox(height: 20),
                  ],

                  // ── お気に入りボタン ──
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: onBookmarkToggle,
                      icon: Icon(isBookmarked ? Icons.bookmark_remove : Icons.bookmark_add),
                      label: Text(isBookmarked ? 'マイ単語から削除' : 'マイ単語に追加'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isBookmarked ? AppTheme.error : AppTheme.secondary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 関連語グリッド
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _RelatedWordsGrid extends StatelessWidget {
  final List<WordModel> words;
  final ValueChanged<String> onTap;

  const _RelatedWordsGrid({
    required this.words,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: words.take(6).map((w) => _RelatedWordChip(
        word: w,
        onTap: () => onTap(w.wordId),
      )).toList(),
    );
  }
}

class _RelatedWordChip extends StatelessWidget {
  final WordModel word;
  final VoidCallback onTap;

  const _RelatedWordChip({
    required this.word,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.primaryLight.withOpacity(0.3),
          border: Border.all(color: AppTheme.primary.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              word.wordName,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppTheme.primary,
                fontFamily: 'NotoSansJP',
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_forward, size: 14, color: AppTheme.primary),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 漢字つながり探索セクション
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _KanjiConnectionSection extends ConsumerWidget {
  final String kanji;
  final String currentWordId;
  final ValueChanged<String> onWordTap;

  const _KanjiConnectionSection({
    required this.kanji,
    required this.currentWordId,
    required this.onWordTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordsAsync = ref.watch(wordsWithKanjiProvider(kanji));

    return wordsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (words) {
        // 自分自身を除外
        final others =
            words.where((w) => w.wordId != currentWordId).take(8).toList();
        if (others.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.accent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                  ),
                  child: Text(
                    kanji,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.accent,
                      fontFamily: 'NotoSansJP',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'を使う言葉',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                    fontFamily: 'NotoSansJP',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: others
                  .map(
                    (w) => GestureDetector(
                      onTap: () => onWordTap(w.wordId),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppTheme.accent.withOpacity(0.08),
                          border: Border.all(
                              color: AppTheme.accent.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // 該当漢字をハイライト
                            ..._highlightKanji(w.wordName, kanji),
                            const SizedBox(width: 4),
                            Text(
                              w.furigana,
                              style: const TextStyle(
                                fontSize: 10,
                                color: AppTheme.textSecondary,
                                fontFamily: 'NotoSansJP',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  List<Widget> _highlightKanji(String wordName, String kanji) {
    return wordName.runes.map((r) {
      final c = String.fromCharCode(r);
      final isTarget = c == kanji;
      return Text(
        c,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isTarget ? AppTheme.accent : AppTheme.textPrimary,
          fontFamily: 'NotoSansJP',
        ),
      );
    }).toList();
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// サブウィジェット（既存）
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _IllustrationArea extends StatelessWidget {
  final WordModel word;
  const _IllustrationArea({required this.word});

  @override
  Widget build(BuildContext context) {
    final bg = _hexToColor(word.illustrationPlaceholder);
    return Container(
      width: double.infinity,
      height: 200,
      color: bg,
      alignment: Alignment.center,
      child: word.illustrationUrl != null
          ? Image.network(word.illustrationUrl!, fit: BoxFit.contain)
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  word.wordName,
                  style: AppTheme.heading2,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  word.furigana,
                  style: AppTheme.bodyMedium.copyWith(color: AppTheme.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
    );
  }
}

class _WordHeader extends StatelessWidget {
  final WordModel word;
  const _WordHeader({required this.word});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(word.wordName, style: AppTheme.heading1),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppTheme.divider),
              ),
              child: Text(
                word.partsOfSpeech,
                style: AppTheme.bodySmall,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(word.furigana, style: AppTheme.bodyLarge.copyWith(color: AppTheme.textSecondary)),
      ],
    );
  }
}

class _GradePicker extends StatelessWidget {
  final int gradeLevel;
  final ValueChanged<int> onChanged;

  const _GradePicker({required this.gradeLevel, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('学年選択', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary, fontFamily: 'NotoSansJP')),
        const SizedBox(height: 8),
        Row(
          children: List.generate(6, (i) {
            final grade = i + 1;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text('$grade年', style: const TextStyle(fontFamily: 'NotoSansJP')),
                selected: gradeLevel == grade,
                onSelected: (_) => onChanged(grade),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.textPrimary, fontFamily: 'NotoSansJP'),
    );
  }
}

class _DescriptionBox extends StatelessWidget {
  final String text;
  const _DescriptionBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Text(
        text,
        style: AppTheme.bodyMedium.copyWith(height: 1.6),
      ),
    );
  }
}

class _NuanceBox extends StatelessWidget {
  final dynamic nuance;
  const _NuanceBox({required this.nuance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (nuance.background.isNotEmpty) ...[
            const Text('Background', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NotoSansJP')),
            Text(nuance.background, style: AppTheme.bodySmall),
            const SizedBox(height: 12),
          ],
          if (nuance.usage.isNotEmpty) ...[
            const Text('Usage', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NotoSansJP')),
            Text(nuance.usage, style: AppTheme.bodySmall),
            const SizedBox(height: 12),
          ],
          if (nuance.contrast.isNotEmpty) ...[
            const Text('Contrast', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'NotoSansJP')),
            Text(nuance.contrast, style: AppTheme.bodySmall),
          ],
        ],
      ),
    );
  }
}

class _SrsInfo extends StatelessWidget {
  final dynamic nextReviewDate;
  const _SrsInfo({required this.nextReviewDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: Border.all(color: AppTheme.primary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, color: AppTheme.primary, size: 18),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('次回復習日', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary, fontFamily: 'NotoSansJP')),
              Text(
                _formatDate(nextReviewDate),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.primary, fontFamily: 'NotoSansJP'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(dynamic date) {
    if (date is DateTime) {
      return '${date.year}年${date.month}月${date.day}日';
    }
    return date.toString();
  }
}

Color _hexToColor(String hex) {
  final h = hex.replaceAll('#', '');
  return Color(int.parse('FF$h', radix: 16));
}
