import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/models/quiz_queue_model.dart';
import 'package:kotoba_e/models/word_model.dart';
import 'package:kotoba_e/providers/word_provider.dart';
import 'package:kotoba_e/providers/srs_provider.dart';
import 'package:kotoba_e/providers/bookmark_provider.dart';
import 'package:kotoba_e/services/local_storage_service.dart';

// ── クイズ完了日履歴（SharedPreferences 永続） ────────────────

class QuizDatesNotifier extends StateNotifier<List<String>> {
  QuizDatesNotifier() : super([]) {
    _init();
  }

  Future<void> _init() async {
    final saved = localStorageService.getQuizDates();
    if (saved.isEmpty) {
      // 初回起動: 過去7日分のモック履歴
      final now = DateTime.now();
      final mock = List.generate(7, (i) => _dateKey(now.subtract(Duration(days: i))));
      state = mock;
      await localStorageService.saveQuizDates(mock);
    } else {
      state = saved;
    }
  }

  Future<void> recordToday() async {
    final today = _dateKey(DateTime.now());
    if (!state.contains(today)) {
      final updated = [...state, today];
      state = updated;
      await localStorageService.saveQuizDates(updated);
    }
  }
}

final quizCompletionDatesProvider =
    StateNotifierProvider<QuizDatesNotifier, List<String>>(
  (ref) => QuizDatesNotifier(),
);

String _dateKey(DateTime d) =>
    '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

// 今週（月〜本日）に完了した日数
final thisWeekCountProvider = Provider<int>((ref) {
  final dates = ref.watch(quizCompletionDatesProvider);
  final now = DateTime.now();
  // 今週の月曜日（weekday: 1=月, 7=日）
  final weekStart = now.subtract(Duration(days: now.weekday - 1));
  int count = 0;
  for (var i = 0; i < 7; i++) {
    final day = weekStart.add(Duration(days: i));
    if (day.isAfter(now)) break;
    if (dates.contains(_dateKey(day))) count++;
  }
  return count;
});

// 今週のどの曜日が完了済みか（7要素 bool、月=0 〜 日=6）
final weekDoneProvider = Provider<List<bool>>((ref) {
  final dates = ref.watch(quizCompletionDatesProvider);
  final now = DateTime.now();
  final weekStart = now.subtract(Duration(days: now.weekday - 1));
  return List.generate(7, (i) {
    final day = weekStart.add(Duration(days: i));
    return dates.contains(_dateKey(day));
  });
});

// ── クイズセッション ────────────────────────────────────────

class QuizSessionState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final List<bool> answers;
  final bool isCompleted;

  const QuizSessionState({
    required this.questions,
    required this.currentIndex,
    required this.answers,
    required this.isCompleted,
  });

  QuizQuestion? get currentQuestion =>
      currentIndex < questions.length ? questions[currentIndex] : null;

  int get correctCount => answers.where((a) => a).length;
  double get correctRate =>
      answers.isEmpty ? 0 : correctCount / answers.length;

  QuizSessionState copyWith({
    List<QuizQuestion>? questions,
    int? currentIndex,
    List<bool>? answers,
    bool? isCompleted,
  }) {
    return QuizSessionState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

final quizSessionProvider =
    StateNotifierProvider<QuizSessionNotifier, QuizSessionState>((ref) {
  return QuizSessionNotifier(ref);
});

class QuizSessionNotifier extends StateNotifier<QuizSessionState> {
  final Ref _ref;

  QuizSessionNotifier(this._ref)
      : super(const QuizSessionState(
          questions: [],
          currentIndex: 0,
          answers: [],
          isCompleted: false,
        ));

  Future<void> initializeQuiz({int gradeLevel = 3}) async {
    final allWords = await _ref.read(allWordsProvider.future);
    if (allWords.isEmpty) return;

    // SRS優先: 今日の復習対象 + 未レビューのブックマーク
    final dueIds = _ref.read(dueTodayWordIdsProvider).toSet();
    final srsData = _ref.read(srsProvider);
    final bookmarks = _ref.read(bookmarksProvider);
    final unreviewedIds = bookmarks
        .where((b) => !srsData.containsKey(b.wordId))
        .map((b) => b.wordId)
        .toSet();

    final priorityIds = {...dueIds, ...unreviewedIds};
    final priorityWords = allWords
        .where((w) => priorityIds.contains(w.wordId))
        .toList()
      ..shuffle();
    final otherWords = allWords
        .where((w) => !priorityIds.contains(w.wordId))
        .toList()
      ..shuffle();

    final questionWords = [...priorityWords, ...otherWords].take(5).toList();

    state = QuizSessionState(
      questions: _buildQuestions(questionWords, allWords, gradeLevel: gradeLevel),
      currentIndex: 0,
      answers: [],
      isCompleted: false,
    );
  }

  List<QuizQuestion> _buildQuestions(
    List<WordModel> questionWords,
    List<WordModel> allWords, {
    int gradeLevel = 3,
  }) {
    final gradeKey = 'grade$gradeLevel';

    return questionWords.asMap().entries.map((entry) {
      final i = entry.key;
      final word = entry.value;

      final description = word.descriptions[gradeKey] ??
          word.descriptions['grade3'] ??
          word.descriptions['grade1'] ??
          word.wordName;

      final wrongWords = allWords
          .where((w) => w.wordId != word.wordId)
          .toList()
        ..shuffle();
      final wrongOptions = wrongWords.take(3).map((w) {
        return w.descriptions[gradeKey] ??
            w.descriptions['grade3'] ??
            w.descriptions['grade1'] ??
            w.wordName;
      }).toList();

      final options = [description, ...wrongOptions]..shuffle();
      final correctIndex = options.indexOf(description);

      return QuizQuestion(
        wordId: word.wordId,
        wordName: word.wordName,
        question: '「${word.wordName}」の意味は？',
        options: options,
        correctIndex: correctIndex,
        questionNumber: i + 1,
        totalQuestions: questionWords.length,
      );
    }).toList();
  }

  void answerQuestion(int selectedIndex) {
    final current = state.currentQuestion;
    if (current == null) return;

    final isCorrect = selectedIndex == current.correctIndex;
    final newAnswers = [...state.answers, isCorrect];
    final nextIndex = state.currentIndex + 1;
    final isCompleted = nextIndex >= state.questions.length;

    state = state.copyWith(
      currentIndex: nextIndex,
      answers: newAnswers,
      isCompleted: isCompleted,
    );

    if (isCompleted) {
      _ref.read(quizCompletionDatesProvider.notifier).recordToday();
      _updateSrsAndStats(newAnswers, state.questions);
    }
  }

  void _updateSrsAndStats(List<bool> answers, List<QuizQuestion> questions) {
    for (var i = 0; i < questions.length && i < answers.length; i++) {
      _ref.read(srsProvider.notifier).updateAfterQuiz(
        questions[i].wordId,
        answers[i],
      );
    }
    _ref.read(quizAccumulatedStatsProvider.notifier).record(
      answers.length,
      answers.where((a) => a).length,
    );
  }

  void reset() {
    state = const QuizSessionState(
      questions: [],
      currentIndex: 0,
      answers: [],
      isCompleted: false,
    );
  }
}

// 今日のクイズ完了状態
final todayQuizCompletedProvider = Provider<bool>((ref) {
  final dates = ref.watch(quizCompletionDatesProvider);
  return dates.contains(_dateKey(DateTime.now()));
});

// ── クイズ累計統計（SharedPreferences 永続） ──────────────────

class AccumulatedStatsNotifier extends StateNotifier<Map<String, int>> {
  AccumulatedStatsNotifier() : super({'total': 0, 'correct': 0}) {
    _load();
  }

  void _load() {
    state = localStorageService.getQuizStats();
  }

  Future<void> record(int addTotal, int addCorrect) async {
    final total = (state['total'] ?? 0) + addTotal;
    final correct = (state['correct'] ?? 0) + addCorrect;
    state = {'total': total, 'correct': correct};
    await localStorageService.saveQuizStats(total: total, correct: correct);
  }
}

final quizAccumulatedStatsProvider =
    StateNotifierProvider<AccumulatedStatsNotifier, Map<String, int>>(
  (ref) => AccumulatedStatsNotifier(),
);

// クイズ統計（実データ）
final quizStatsProvider = Provider<Map<String, dynamic>>((ref) {
  final stats = ref.watch(quizAccumulatedStatsProvider);
  final total = stats['total'] ?? 0;
  final correct = stats['correct'] ?? 0;
  return {
    'quizTotal': total,
    'quizCorrect': correct,
    'correctRate': total > 0 ? correct / total : 0.0,
  };
});
