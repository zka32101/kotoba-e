import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kotoba_e/firebase_options.dart';
import 'package:kotoba_e/models/daily_word_model.dart';
import 'package:kotoba_e/providers/auth_provider.dart';
import 'package:kotoba_e/services/local_storage_service.dart';
import 'package:kotoba_e/utils/router_provider.dart';

/// 季節の言葉一覧（assets/data/daily_words_2026.json から読み込み）
final dailyWordsProvider = FutureProvider<List<DailyWord>>((ref) async {
  try {
    final raw = await rootBundle.loadString('assets/data/daily_words_2026.json');
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final list = json['dailyWords'] as List<dynamic>;
    return list
        .map((j) => DailyWord.fromJson(j as Map<String, dynamic>))
        .toList();
  } catch (_) {
    return [];
  }
});

/// 本日の季節用語を取得
final todaysDailyWordProvider = FutureProvider<DailyWord?>((ref) async {
  final words = await ref.watch(dailyWordsProvider.future);
  if (words.isEmpty) return null;

  final dateStr = _todayDateStr();
  for (final word in words) {
    if (word.date == dateStr) return word;
  }

  // データ年と異なる年に実行された場合など、一致がない時は年内通算日で周期選択
  final now = DateTime.now();
  final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays + 1;
  return words[(dayOfYear - 1) % words.length];
});

/// ユーザーの FCM トークンを管理
final fcmTokenProvider = FutureProvider<String?>((ref) async {
  try {
    return await FirebaseMessaging.instance.getToken();
  } catch (e) {
    return null;
  }
});

/// 通知を許可するかどうか（設定画面のトグルで変更、SharedPreferencesに永続化）
class NotificationPermissionNotifier extends StateNotifier<bool> {
  NotificationPermissionNotifier()
      : super(localStorageService.isDailyNotificationEnabled());

  Future<void> setEnabled(bool enabled) async {
    state = enabled;
    await localStorageService.setDailyNotificationEnabled(enabled);
  }
}

final notificationPermissionProvider =
    StateNotifierProvider<NotificationPermissionNotifier, bool>(
  (ref) => NotificationPermissionNotifier(),
);

/// フォアグラウンドで受信した最新の通知（UI側でSnackBar等の表示に使用）
final latestForegroundMessageProvider =
    StateProvider<RemoteMessage?>((ref) => null);

/// ユーザーの FCM トークンを Firestore に保存
// userId の変化のみを監視する（currentUserProvider 全体を watch すると、
// ユーザー情報の更新のたびに不要なFirestore書き込みが発生してしまうため）。
final fcmTokenSyncProvider = FutureProvider<void>((ref) async {
  final userId = ref.watch(currentUserProvider.select((u) => u?.userId));
  if (userId == null) return;

  final notificationsEnabled = ref.watch(notificationPermissionProvider);
  if (!notificationsEnabled) return;

  final token = await ref.watch(fcmTokenProvider.future);
  if (token == null) return;

  await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('fcm_tokens')
      .doc(token)
      .set({
    'token': token,
    'createdAt': FieldValue.serverTimestamp(),
    'platform': 'flutter',
  });
});

/// 今日の通知が既に送信されたか確認
final dailyNotificationSentProvider = FutureProvider<bool>((ref) async {
  final userId = ref.watch(currentUserProvider.select((u) => u?.userId));
  if (userId == null) return false;

  final doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('daily_notifications')
      .doc(_todayDateStr())
      .get();

  return doc.exists;
});

/// 今日の通知履歴を記録
Future<void> recordDailyNotificationSent({
  required String userId,
  String? wordId,
}) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('daily_notifications')
      .doc(_todayDateStr())
      .set({
    'sentAt': FieldValue.serverTimestamp(),
    'wordId': wordId,
  });
}

String _todayDateStr() {
  final now = DateTime.now();
  return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
}

/// Firebase Messaging の初期化
/// [container] は main() で作成した ProviderContainer（router や auth 状態へアクセスするため）
Future<void> initializeFirebaseMessaging(ProviderContainer container) async {
  try {
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    final authorized =
        settings.authorizationStatus == AuthorizationStatus.authorized ||
            settings.authorizationStatus == AuthorizationStatus.provisional;
    if (!authorized) return;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // フォアグラウンド受信：状態を更新し、UI側（KotobaEApp）でSnackBar表示
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      container.read(latestForegroundMessageProvider.notifier).state = message;
    });

    // バックグラウンドで受信した通知をタップしてアプリを開いた場合
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessageTap(container, message);
    });

    // 完全終了状態から通知タップでアプリを起動した場合
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageTap(container, initialMessage);
    }
  } catch (e) {
    rethrow;
  }
}

/// バックグラウンド メッセージハンドラー（別Isolateで実行されるためFirebase再初期化が必要）
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (_) {
    // プレースホルダー値のまま起動した場合はそのまま何もしない
  }
}

/// 通知タップハンドラー：通知データに wordId があれば単語詳細へ、なければ今日の言葉画面へ
void _handleMessageTap(ProviderContainer container, RemoteMessage message) {
  final router = container.read(routerProvider);
  final wordId = message.data['wordId'];
  if (wordId is String && wordId.isNotEmpty) {
    router.go('/home/word/$wordId');
  } else {
    router.go('/home/daily-word');
  }
}
