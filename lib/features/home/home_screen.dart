import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../theme/tokens.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/metric_card.dart';
import '../../providers/app_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(scanMetricsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Today')),
      bottomNavigationBar: _BottomNav(current: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Tokens.s16),
          child: ListView(children: [
            Container(
              padding: const EdgeInsets.all(Tokens.s16),
              decoration: BoxDecoration(
                color: Tokens.bg800,
                borderRadius: BorderRadius.circular(Tokens.r16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quick Start',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: Tokens.s12),
                  Row(children: [
                    Expanded(
                      child: PrimaryButton(
                        label: 'Start session',
                        onPressed: () => context.go('/workout'),
                      ),
                    ),
                    const SizedBox(width: Tokens.s12),
                    Expanded(
                      child: PrimaryButton(
                        label: 'Scan form (10–15s)',
                        onPressed: () => context.go('/capture'),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: Tokens.s16),
            Text('Last result',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: Tokens.s12),
            for (final m in metrics) ...[
              MetricCard(
                  title: m.label,
                  value: m.value,
                  target: m.target,
                  severity: m.severity,
                  confidence: m.confidence),
              const SizedBox(height: Tokens.s12),
            ],
            const SizedBox(height: Tokens.s16),
            Row(children: [
              Expanded(
                  child: PrimaryButton(
                      label: 'Chat coach',
                      ghost: true,
                      onPressed: () => context.go('/chat'))),
              const SizedBox(width: Tokens.s12),
              Expanded(
                  child: PrimaryButton(
                      label: 'Library',
                      ghost: true,
                      onPressed: () => context.go('/library'))),
            ]),
          ]),
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final int current;
  const _BottomNav({required this.current});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 64,
      selectedIndex: current,
      backgroundColor: Tokens.bg800,
      onDestinationSelected: (i) {
        switch (i) {
          case 0:
            context.go('/home'); break;
          case 1:
            context.go('/workout'); break;
          case 2:
            context.go('/capture'); break;
          case 3:
            context.go('/chat'); break;
          case 4:
            context.go('/settings'); break;
        }
      },
      destinations: const [
        NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(Icons.library_books_outlined),
            selectedIcon: Icon(Icons.library_books),
            label: 'Plan'),
        NavigationDestination(
            icon: Icon(Icons.center_focus_strong),
            selectedIcon: Icon(Icons.center_focus_strong),
            label: 'Scan'),
        NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Chat'),
        NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
