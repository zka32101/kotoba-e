import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotoba_e/providers/auth_provider.dart';

/// アプリ全体のUI文言辞書。
///
/// flutter_gen (ARB + build_runner) は使わず、プレーンなDartマップで実装している。
/// これはコード生成ステップを増やさないための意図的な選択：
/// main branch は現在 build_runner 未実行によるコンパイルエラーを抱えており、
/// 同種の「ローカル生成待ち」依存を新たに追加しない。
class AppStrings {
  AppStrings._();

  static const Map<String, Map<String, String>> _values = {
    'ja': {
      // ナビゲーション
      'nav_home': 'ホーム',
      'nav_search': '検索',
      'nav_quiz': 'クイズ',
      'nav_tree': 'ツリー',
      'nav_favorites': 'マイ単語',

      // 設定画面
      'settings_title': '設定',
      'settings_guest': 'ゲスト',
      'settings_plan_free': '無料プラン',
      'settings_plan_premium': 'プレミアム',
      'settings_section_language': '言語',
      'settings_section_user_type': 'ユーザータイプ',
      'settings_user_type_domestic': '国内向け',
      'settings_user_type_global': 'グローバル',
      'settings_section_grade': '学年 / レベル',
      'settings_grade_suffix': '年生',
      'settings_section_premium': 'プレミアム',
      'settings_manage_subscription': 'サブスクリプション管理',
      'settings_section_account': 'アカウント',
      'settings_logout': 'ログアウト',
      'settings_version': 'バージョン 1.0.0',
      'settings_section_text_display': '表記法',
      'settings_section_notifications': '通知',
      'settings_daily_notification_toggle': '今日の言葉リマインダー',
    },
    'en': {
      // Navigation
      'nav_home': 'Home',
      'nav_search': 'Search',
      'nav_quiz': 'Quiz',
      'nav_tree': 'Tree',
      'nav_favorites': 'My Words',

      // Settings screen
      'settings_title': 'Settings',
      'settings_guest': 'Guest',
      'settings_plan_free': 'Free Plan',
      'settings_plan_premium': 'Premium',
      'settings_section_language': 'Language',
      'settings_section_user_type': 'User Type',
      'settings_user_type_domestic': 'Domestic',
      'settings_user_type_global': 'Global',
      'settings_section_grade': 'Grade / Level',
      'settings_grade_suffix': '',
      'settings_section_premium': 'Premium',
      'settings_manage_subscription': 'Manage Subscription',
      'settings_section_account': 'Account',
      'settings_logout': 'Log Out',
      'settings_version': 'Version 1.0.0',
      'settings_section_text_display': 'Text Display',
      'settings_section_notifications': 'Notifications',
      'settings_daily_notification_toggle': 'Daily Word Reminder',
    },
  };

  static String of(String languageCode, String key) {
    return _values[languageCode]?[key] ?? _values['ja']?[key] ?? key;
  }
}

/// `selectedLanguageProvider` に連動する文言アクセサー。
/// 使い方: `final t = ref.watch(appStringsProvider); t('nav_home')`
final appStringsProvider = Provider<String Function(String)>((ref) {
  final languageCode = ref.watch(selectedLanguageProvider);
  return (key) => AppStrings.of(languageCode, key);
});
