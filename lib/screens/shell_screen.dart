import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';
import 'package:kotoba_e/l10n/app_strings.dart';

class ShellScreen extends ConsumerWidget {
  final Widget child;

  const ShellScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(appStringsProvider);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getCurrentIndex(context),
        onTap: (index) => _navigateTo(context, index),
        backgroundColor: AppTheme.surface,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: t('nav_home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: t('nav_search'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.quiz),
            label: t('nav_quiz'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.nature),
            label: t('nav_tree'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark),
            label: t('nav_favorites'),
          ),
        ],
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.contains('search')) return 1;
    if (location.contains('quiz')) return 2;
    if (location.contains('tree')) return 3;
    if (location.contains('favorites')) return 4;
    return 0;
  }

  void _navigateTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/home/search');
        break;
      case 2:
        context.go('/home/quiz');
        break;
      case 3:
        context.go('/home/tree');
        break;
      case 4:
        context.go('/home/favorites');
        break;
    }
  }
}
