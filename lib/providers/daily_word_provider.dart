import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kotoba_e/models/daily_word_model.dart';
import 'dart:convert';

/// 本日の季節用語を取得
final todaysDailyWordProvider = FutureProvider<DailyWord?>((ref) async {
  try {
    final now = DateTime.now();
    final dayOfYear = int.parse(now.toString().split('-').sublist(1).join());

    // JSONから今日の用語を取得（実装では Firestore から取得する予定）
    final word = await _getDailyWordForDay(dayOfYear);
    return word;
  } catch (e) {
    return null;
  }
});

/// ユーザーの FCM トークンを管理
final fcmTokenProvider = FutureProvider<String?>((ref) async {
  try {
    final token = await FirebaseMessaging.instance.getToken();
    return token;
  } catch (e) {
    return null;
  }
});

/// 通知を許可するかどうか
final notificationPermissionProvider = StateProvider<bool>((ref) => true);

/// ユーザーの FCM トークンを Firestore に保存
final fcmTokenSyncProvider = FutureProvider<void>((ref) async {
  try {
    final token = await ref.watch(fcmTokenProvider.future);
    if (token != null) {
      final userId = 'current-user'; // 実装では auth から取得
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
    }
  } catch (e) {
    rethrow;
  }
});

/// 今日の通知が既に送信されたか確認
final dailyNotificationSentProvider = FutureProvider<bool>((ref) async {
  try {
    final now = DateTime.now();
    final dateStr = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    final userId = 'current-user';
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('daily_notifications')
        .doc(dateStr)
        .get();

    return doc.exists;
  } catch (e) {
    return false;
  }
});

/// 日の通知履歴を記録
Future<void> recordDailyNotificationSent(String dateStr) async {
  try {
    final userId = 'current-user';
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('daily_notifications')
        .doc(dateStr)
        .set({
      'sentAt': FieldValue.serverTimestamp(),
      'word': null, // 実装では単語情報を保存
    });
  } catch (e) {
    rethrow;
  }
}

/// ヘルパー関数：日付から季節用語を取得
Future<DailyWord?> _getDailyWordForDay(int dayOfYear) async {
  try {
    // 実装では Firestore から取得
    // ここではダミー実装
    return null;
  } catch (e) {
    return null;
  }
}

/// Firebase Messaging の初期化
Future<void> initializeFirebaseMessaging() async {
  try {
    // 通知の許可をリクエスト
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // バックグラウンド メッセージ ハンドラー
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      // フォアグラウンド メッセージ ハンドラー
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _handleMessage(message);
      });

      // 通知タップハンドラー
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        _handleMessageTap(message);
      });
    }
  } catch (e) {
    rethrow;
  }
}

/// バックグラウンド メッセージハンドラー
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // バックグラウンドで受信した通知を処理
  // （Firestore に記録など）
}

/// フォアグラウンド メッセージハンドラー
void _handleMessage(RemoteMessage message) {
  // フォアグラウンドで受信した通知を処理
  // （SnackBar 表示など）
}

/// 通知タップハンドラー
void _handleMessageTap(RemoteMessage message) {
  // 通知がタップされたときの処理
  // （詳細画面へのナビゲーション など）
}
