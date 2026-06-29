import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/firebase_options.dart';
import 'package:kotoba_e/services/local_storage_service.dart';
import 'package:kotoba_e/utils/router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 初期化
  // firebase_options.dart の値を flutterfire configure で本番値に置き換えてください。
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // プレースホルダー値のまま起動した場合はオフラインモードで継続
    debugPrint('[Firebase] 初期化スキップ: $e');
  }

  await localStorageService.init();

  runApp(
    const ProviderScope(
      child: KotobaEApp(),
    ),
  );
}

class KotobaEApp extends ConsumerWidget {
  const KotobaEApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'ことばえ',
      theme: AppTheme.getLightTheme(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
