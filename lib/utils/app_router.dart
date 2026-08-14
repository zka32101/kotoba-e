import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kotoba_e/screens/shell_screen.dart';
import 'package:kotoba_e/screens/welcome_screen.dart';
import 'package:kotoba_e/screens/login_screen.dart';
import 'package:kotoba_e/screens/signup_screen.dart';
import 'package:kotoba_e/screens/home_screen.dart';
import 'package:kotoba_e/screens/search_screen.dart';
import 'package:kotoba_e/screens/word_detail_screen.dart';
import 'package:kotoba_e/screens/quiz_screen.dart';
import 'package:kotoba_e/screens/favorites_screen.dart';
import 'package:kotoba_e/screens/settings_screen.dart';
import 'package:kotoba_e/screens/stats_screen.dart';
import 'package:kotoba_e/screens/tree_screen.dart';
import 'package:kotoba_e/screens/tree_detail_screen.dart';
import 'package:kotoba_e/screens/daily_word_screen.dart';
import 'package:kotoba_e/screens/paywall_screen.dart';
import 'package:kotoba_e/services/local_storage_service.dart';

final appRouter = GoRouter(
  initialLocation: '/welcome',
  redirect: (context, state) {
    final loggedIn = localStorageService.isLoggedIn();
    final loc = state.matchedLocation;
    final onAuth = loc == '/welcome' || loc == '/login' || loc == '/signup';

    if (!loggedIn && !onAuth) return '/welcome';
    if (loggedIn && loc == '/welcome') return '/home';
    return null;
  },
  routes: [
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => ShellScreen(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/home/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/home/word/:wordId',
          builder: (context, state) {
            final wordId = state.pathParameters['wordId'] ?? '';
            return WordDetailScreen(wordId: wordId);
          },
        ),
        GoRoute(
          path: '/home/quiz',
          builder: (context, state) => const QuizScreen(),
        ),
        GoRoute(
          path: '/home/favorites',
          builder: (context, state) => const FavoritesScreen(),
        ),
        GoRoute(
          path: '/home/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/home/stats',
          builder: (context, state) => const StatsScreen(),
        ),
        GoRoute(
          path: '/home/tree',
          builder: (context, state) => const TreeScreen(),
        ),
        GoRoute(
          path: '/home/tree/:wordId',
          builder: (context, state) {
            final wordId = state.pathParameters['wordId'] ?? '';
            return TreeDetailScreen(wordId: wordId);
          },
        ),
        GoRoute(
          path: '/home/daily-word',
          builder: (context, state) => const DailyWordScreen(),
        ),
        GoRoute(
          path: '/home/paywall',
          builder: (context, state) => const PaywallScreen(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('ページが見つかりません: ${state.error}')),
  ),
);
