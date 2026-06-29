import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/services/local_storage_service.dart';

// SRS intervals in days — easy/normal/hard
const _srsIntervals = {
  'easy': [7, 14, 30, 60, 90],
  'normal': [3, 7, 14, 30, 60],
  'hard': [1, 3, 7, 14, 30],
};

class SrsEntry {
  final String wordId;
  final String difficulty; // easy | normal | hard
  final int intervalIndex;
  final DateTime nextReviewDate;

  const SrsEntry({
    required this.wordId,
    required this.difficulty,
    required this.intervalIndex,
    required this.nextReviewDate,
  });

  Map<String, dynamic> toJson() => {
    'wordId': wordId,
    'difficulty': difficulty,
    'intervalIndex': intervalIndex,
    'nextReviewDate': nextReviewDate.toIso8601String(),
  };

  factory SrsEntry.fromJson(Map<String, dynamic> json) => SrsEntry(
    wordId: json['wordId'] as String,
    difficulty: json['difficulty'] as String? ?? 'normal',
    intervalIndex: json['intervalIndex'] as int? ?? 0,
    nextReviewDate: DateTime.parse(json['nextReviewDate'] as String),
  );
}

class SrsNotifier extends StateNotifier<Map<String, SrsEntry>> {
  SrsNotifier() : super({}) {
    _load();
  }

  void _load() {
    final raw = localStorageService.getSrsData();
    state = raw.map((k, v) => MapEntry(k, SrsEntry.fromJson(v)));
  }

  Future<void> updateAfterQuiz(String wordId, bool isCorrect) async {
    final now = DateTime.now();
    final existing = state[wordId];

    final SrsEntry entry;
    if (!isCorrect) {
      entry = SrsEntry(
        wordId: wordId,
        difficulty: 'hard',
        intervalIndex: 0,
        nextReviewDate: now.add(const Duration(days: 1)),
      );
    } else {
      final difficulty = existing?.difficulty ?? 'normal';
      final currentIndex = existing?.intervalIndex ?? 0;
      final intervals = _srsIntervals[difficulty]!;
      final days = intervals[currentIndex.clamp(0, intervals.length - 1)];
      final nextIndex = (currentIndex + 1).clamp(0, intervals.length - 1);

      // Upgrade difficulty when reaching the top interval step
      final String newDifficulty;
      if (nextIndex >= intervals.length - 1) {
        newDifficulty = difficulty == 'hard'
            ? 'normal'
            : difficulty == 'normal'
                ? 'easy'
                : 'easy';
      } else {
        newDifficulty = difficulty;
      }

      entry = SrsEntry(
        wordId: wordId,
        difficulty: newDifficulty,
        intervalIndex: nextIndex,
        nextReviewDate: now.add(Duration(days: days)),
      );
    }

    state = {...state, wordId: entry};
    await _persist();
  }

  // Called when a word is bookmarked for the first time — makes it due immediately
  Future<void> initWord(String wordId) async {
    if (state.containsKey(wordId)) return;
    final entry = SrsEntry(
      wordId: wordId,
      difficulty: 'normal',
      intervalIndex: 0,
      nextReviewDate: DateTime.now(),
    );
    state = {...state, wordId: entry};
    await _persist();
  }

  Future<void> _persist() async {
    await localStorageService.saveSrsData(
      state.map((k, v) => MapEntry(k, v.toJson())),
    );
  }
}

final srsProvider = StateNotifierProvider<SrsNotifier, Map<String, SrsEntry>>(
  (ref) => SrsNotifier(),
);

// WordId list due for review today (nextReviewDate <= end of today)
final dueTodayWordIdsProvider = Provider<List<String>>((ref) {
  final srsData = ref.watch(srsProvider);
  final now = DateTime.now();
  final endOfToday = DateTime(now.year, now.month, now.day, 23, 59, 59);
  return srsData.values
      .where((e) => !e.nextReviewDate.isAfter(endOfToday))
      .map((e) => e.wordId)
      .toList();
});

final dueCountProvider = Provider<int>(
  (ref) => ref.watch(dueTodayWordIdsProvider).length,
);

// SRS entry for a single word (family provider)
final srsEntryProvider = Provider.family<SrsEntry?, String>((ref, wordId) {
  return ref.watch(srsProvider)[wordId];
});
