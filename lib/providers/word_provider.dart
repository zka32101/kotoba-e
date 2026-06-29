import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/data/mock_words.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/services/local_storage_service.dart';
import 'package:kotoba_e/services/word_data_service.dart';
import 'package:kotoba_e/services/word_index.dart';

// ─── 基盤：全単語リスト ──────────────────────────────────────

/// 全単語（mock_words + words.json をマージ、頻度降順）
/// Firebase 接続後はここで Firestore から取得
final allWordsProvider = FutureProvider<List<WordModel>>((ref) async {
  final jsonWords = await WordDataService.loadFromJson();
  final all = [...mockWords, ...jsonWords];
  all.sort((a, b) => b.frequency.compareTo(a.frequency));
  return all;
});

// ─── 検索インデックス ─────────────────────────────────────────

/// 全単語から構築した WordIndex（カテゴリ/検索/漢字逆引き）
final wordIndexProvider = FutureProvider<WordIndex>((ref) async {
  final words = await ref.watch(allWordsProvider.future);
  return WordIndex.build(words);
});

// ─── 単語取得 ─────────────────────────────────────────────────

/// wordId で単語を取得（O(1) ハッシュマップ参照）
final wordByIdProvider =
    FutureProvider.family<WordModel?, String>((ref, wordId) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.get(wordId);
});

// ─── 検索 ─────────────────────────────────────────────────────

/// 検索クエリ（ユーザー入力）
final searchQueryProvider = StateProvider<String>((ref) => '');

/// 全文検索結果（wordName / furigana / 説明文 を対象、関連度順）
/// 空クエリ時は頻度順の全単語を返す
final searchResultsProvider = FutureProvider<List<WordModel>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final index = await ref.watch(wordIndexProvider.future);

  if (query.trim().isEmpty) {
    return (await ref.watch(allWordsProvider.future));
  }
  return index.search(query.trim());
});

// ─── 品詞フィルター ───────────────────────────────────────────

/// 品詞フィルター（null = 全品詞）
final posFilterProvider = StateProvider<String?>((ref) => null);

/// 品詞でフィルタリングした単語リスト
final filteredByPosProvider = FutureProvider<List<WordModel>>((ref) async {
  final pos = ref.watch(posFilterProvider);
  final words = await ref.watch(allWordsProvider.future);
  if (pos == null) return words;
  return words.where((w) => w.partsOfSpeech == pos).toList();
});

// ─── カテゴリ ─────────────────────────────────────────────────

/// 利用可能なカテゴリグループ一覧（表示順）
final wordGroupsProvider = FutureProvider<List<WordGroup>>((ref) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.groups;
});

/// 選択中カテゴリ ID
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

/// カテゴリ別単語リスト（頻度降順）
final wordsByCategoryProvider =
    FutureProvider.family<List<WordModel>, String>((ref, categoryId) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.byCategory(categoryId);
});

/// カテゴリ別件数マップ（ホーム画面の件数バッジ用）
final categoryCountsProvider =
    FutureProvider<Map<String, int>>((ref) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.categoryCounts;
});

/// ある単語のカテゴリ ID
final wordCategoryProvider =
    FutureProvider.family<String, String>((ref, wordId) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.categoryOf(wordId);
});

// ─── 関連語 ───────────────────────────────────────────────────

/// 関連語リスト（同カテゴリ・頻度降順・最大 8 件）
final relatedWordsProvider =
    FutureProvider.family<List<WordModel>, String>((ref, wordId) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.relatedTo(wordId);
});

// ─── 漢字逆引き ───────────────────────────────────────────────

/// 指定漢字を含む単語リスト（単語詳細画面の「この漢字を使う言葉」）
final wordsWithKanjiProvider =
    FutureProvider.family<List<WordModel>, String>((ref, kanji) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.byKanji(kanji);
});

/// 頻出漢字トップ 30（漢字探索ページ用）
final topKanjiProvider =
    FutureProvider<List<MapEntry<String, int>>>((ref) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.topKanji(topN: 30, min: 3);
});

// ─── 後方互換エイリアス（既存画面との互換性維持）──────────────────

/// @deprecated searchResultsProvider を使用してください
final searchWordProvider = StateProvider<String>((ref) => '');

/// @deprecated searchResultsProvider を使用してください
final filteredWordsProvider = FutureProvider<List<WordModel>>((ref) async {
  final query = ref.watch(searchWordProvider);
  final index = await ref.watch(wordIndexProvider.future);
  if (query.trim().isEmpty) {
    return await ref.watch(allWordsProvider.future);
  }
  return index.search(query.trim());
});

/// @deprecated wordByIdProvider を使用してください
final wordDetailProvider =
    FutureProvider.family<WordModel?, String>((ref, wordId) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.get(wordId);
});

// ─── 最近見た単語（履歴）─────────────────────────────────────

/// 最近見た単語の wordId リストの変更通知
final recentWordsRefreshProvider = StateProvider<int>((ref) => 0);

/// 単語を「最近見た」に記録 + コレクション登録
Future<void> recordWordView(WidgetRef ref, String wordId) async {
  await localStorageService.addRecentWord(wordId);
  await localStorageService.markWordSeen(wordId);
  ref.read(recentWordsRefreshProvider.notifier).state++;
}

/// 最近見た単語リスト（新しい順、WordModel）
final recentWordsProvider = FutureProvider<List<WordModel>>((ref) async {
  ref.watch(recentWordsRefreshProvider); // 変更を監視
  final index = await ref.watch(wordIndexProvider.future);
  final ids = localStorageService.getRecentWords();
  return ids.map((id) => index.get(id)).whereType<WordModel>().toList();
});

// ─── コレクション図鑑 ─────────────────────────────────────────

/// 閲覧済み単語数（カテゴリ別の進捗計算用）
final seenWordIdsProvider = Provider<Set<String>>((ref) {
  ref.watch(recentWordsRefreshProvider); // 変更を監視
  return localStorageService.getSeenWords().toSet();
});

/// カテゴリ別コレクション進捗
/// {categoryId: (seen: 閲覧数, total: 総数)}
final collectionProgressProvider =
    FutureProvider<List<CollectionEntry>>((ref) async {
  final index = await ref.watch(wordIndexProvider.future);
  final seen = ref.watch(seenWordIdsProvider);
  final counts = index.categoryCounts;

  final entries = <CollectionEntry>[];
  for (final group in index.groups) {
    final total = counts[group.id] ?? 0;
    if (total == 0) continue;
    final categoryWords = index.byCategory(group.id);
    final seenCount =
        categoryWords.where((w) => seen.contains(w.wordId)).length;
    entries.add(CollectionEntry(
      group: group,
      seen: seenCount,
      total: total,
    ));
  }
  return entries;
});

/// コレクション進捗エントリ
class CollectionEntry {
  final WordGroup group;
  final int seen;
  final int total;

  const CollectionEntry({
    required this.group,
    required this.seen,
    required this.total,
  });

  double get progress => total == 0 ? 0 : seen / total;
  bool get isComplete => seen >= total && total > 0;
}

// ─── 統計 ─────────────────────────────────────────────────────

/// 総単語数
final wordCountProvider = FutureProvider<int>((ref) async {
  final index = await ref.watch(wordIndexProvider.future);
  return index.totalWords;
});

/// 閲覧済み総単語数（図鑑のグローバル進捗）
final totalSeenProvider = Provider<int>((ref) {
  ref.watch(recentWordsRefreshProvider);
  return localStorageService.getSeenWords().length;
});
