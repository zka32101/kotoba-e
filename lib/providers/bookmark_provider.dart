import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/models/bookmark_model.dart';
import 'package:kotoba_e/providers/srs_provider.dart';
import 'package:kotoba_e/services/local_storage_service.dart';

final bookmarksProvider =
    StateNotifierProvider<BookmarksNotifier, List<BookmarkModel>>((ref) {
  return BookmarksNotifier();
});

class BookmarksNotifier extends StateNotifier<List<BookmarkModel>> {
  BookmarksNotifier() : super([]) {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    final saved = localStorageService.getBookmarks();
    if (saved.isNotEmpty) {
      try {
        state = saved.map((m) => BookmarkModel.fromJson(m)).toList();
        return;
      } catch (_) {
        // 破損データは無視してモックにフォールバック
      }
    }
    // 初回: モックデータ
    state = [
      BookmarkModel(
        bookmarkId: 'bm1',
        userId: 'user1',
        wordId: 'word1',
        wordName: '漢字',
        bookmarkedAt: DateTime.now().subtract(const Duration(days: 5)),
        status: 'reviewing',
      ),
      BookmarkModel(
        bookmarkId: 'bm2',
        userId: 'user1',
        wordId: 'word4',
        wordName: 'いただきます',
        bookmarkedAt: DateTime.now().subtract(const Duration(days: 2)),
        status: 'new',
      ),
      BookmarkModel(
        bookmarkId: 'bm3',
        userId: 'user1',
        wordId: 'word7',
        wordName: '木漏れ日',
        bookmarkedAt: DateTime.now().subtract(const Duration(days: 10)),
        status: 'mastered',
      ),
    ];
    await _persist();
  }

  Future<void> _persist() async {
    await localStorageService.saveBookmarks(
      state.map((b) => b.toJson()).toList(),
    );
  }

  Future<void> addBookmark({
    required String userId,
    required String wordId,
    required String wordName,
  }) async {
    final already = state.any((b) => b.wordId == wordId);
    if (already) return;

    state = [
      ...state,
      BookmarkModel(
        bookmarkId: '${userId}_$wordId',
        userId: userId,
        wordId: wordId,
        wordName: wordName,
        bookmarkedAt: DateTime.now(),
        status: 'new',
      ),
    ];
    await _persist();
  }

  Future<void> removeBookmark(String wordId) async {
    state = state.where((b) => b.wordId != wordId).toList();
    await _persist();
  }

  Future<void> updateStatus(String wordId, String status) async {
    state = state.map((b) {
      if (b.wordId == wordId) {
        return b.copyWith(status: status, reviewedAt: DateTime.now());
      }
      return b;
    }).toList();
    await _persist();
  }
}

final isBookmarkedProvider = Provider.family<bool, String>((ref, wordId) {
  return ref.watch(bookmarksProvider).any((b) => b.wordId == wordId);
});

final bookmarksByStatusProvider =
    Provider.family<List<BookmarkModel>, String>((ref, status) {
  final bookmarks = ref.watch(bookmarksProvider);
  if (status == 'all') return bookmarks;
  if (status == 'due') {
    final dueIds = ref.watch(dueTodayWordIdsProvider).toSet();
    return bookmarks.where((b) => dueIds.contains(b.wordId)).toList();
  }
  return bookmarks.where((b) => b.status == status).toList();
});
