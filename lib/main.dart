import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/firebase_options.dart';
import 'package:kotoba_e/providers/daily_word_provider.dart';
import 'package:kotoba_e/services/local_storage_service.dart';
import 'package:kotoba_e/services/revenue_cat_service.dart';
import 'package:kotoba_e/utils/router_provider.dart';

/// 通知タップ等、BuildContext を経由せずにSnackBarを表示するためのキー
final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await localStorageService.init();

  // Firebase 初期化（既に初期化されている場合はスキップ）
  // firebase_options.dart の値を flutterfire configure で本番値に置き換えてください。
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    // プレースホルダー値のまま起動した場合はオフラインモードで継続
    debugPrint('[Firebase] 初期化スキップ: $e');
  }

  // RevenueCat 初期化（後でユーザーログイン時に userId を設定）
  try {
    await revenueCatService.initialize(userId: 'anonymous');
    debugPrint('[RevenueCat] 初期化完了');
  } catch (e) {
    debugPrint('[RevenueCat] 初期化エラー: $e');
  }

  // runApp より前に router 等へアクセスするため、ProviderContainer を明示的に作成
  final container = ProviderContainer();

  try {
    await initializeFirebaseMessaging(container);
    debugPrint('[FCM] 初期化完了');
  } catch (e) {
    debugPrint('[FCM] 初期化エラー: $e');
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const KotobaEApp(),
    ),
  );
}

class KotobaEApp extends ConsumerWidget {
  const KotobaEApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    ref.listen(latestForegroundMessageProvider, (previous, message) {
      if (message == null) return;
      final title = message.notification?.title;
      final body = message.notification?.body;
      final text = [title, body].whereType<String>().join(' - ');
      if (text.isEmpty) return;
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text(text)),
      );
    });

    return MaterialApp.router(
      title: 'ことばえ',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: AppTheme.getLightTheme(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
