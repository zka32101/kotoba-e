import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/config/theme.dart';

class ShellScreen extends StatelessWidget {
  final Widget child;

  const ShellScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getCurrentIndex(context),
        onTap: (index) => _navigateTo(context, index),
        backgroundColor: AppTheme.surface,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'クイズ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nature),
            label: 'ツリー',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'マイ単語',
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
