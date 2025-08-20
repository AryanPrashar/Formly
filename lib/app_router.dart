import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/onboarding/onboarding_screen.dart';
import 'features/home/home_screen.dart';
import 'features/capture/capture_ready_screen.dart';
import 'features/capture/capture_scan_screen.dart';
import 'features/capture/analysis_result_screen.dart';
import 'features/workout/workout_editor_screen.dart';
import 'features/chat/chat_screen.dart';
import 'features/paywall/paywall_screen.dart';
import 'features/library/library_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/history/history_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
    GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
    GoRoute(path: '/capture', builder: (_, __) => const CaptureReadyScreen()),
    GoRoute(path: '/scan', builder: (_, __) => const CaptureScanScreen()),
    GoRoute(path: '/result', builder: (_, __) => const AnalysisResultScreen()),
    GoRoute(path: '/workout', builder: (_, __) => const WorkoutEditorScreen()),
    GoRoute(path: '/chat', builder: (_, __) => const ChatScreen()),
    GoRoute(path: '/paywall', builder: (_, __) => const PaywallScreen()),
    GoRoute(path: '/library', builder: (_, __) => const LibraryScreen()),
    GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
    GoRoute(path: '/history', builder: (_, __) => const HistoryScreen()),
  ],
);
