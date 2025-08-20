import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/tokens.dart';
import '../../widgets/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Tokens.s24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('FORMLY', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: Tokens.s24),
            Expanded(
              child: ListView(children: const [
                _Card(
                    title: 'Plan smarter',
                    subtitle: 'Personalized workouts that adapt to you.'),
                SizedBox(height: Tokens.s16),
                _Card(
                    title: 'Coach chat',
                    subtitle: 'Ask anything. Get cues & plans instantly.'),
                SizedBox(height: Tokens.s16),
                _Card(
                    title: 'Form Fixer',
                    subtitle:
                        'Scan your reps in 10–15s and get a single, clear fix.'),
              ]),
            ),
            PrimaryButton(label: 'Get started', onPressed: () => context.go('/home')),
            const SizedBox(height: Tokens.s8),
            PrimaryButton(label: 'Try as guest', ghost: true, onPressed: () => context.go('/home')),
          ]),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final String title;
  final String subtitle;
  const _Card({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Tokens.s16),
      decoration: BoxDecoration(
        color: Tokens.bg800,
        borderRadius: BorderRadius.circular(Tokens.r16),
        boxShadow: Tokens.elevation2,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: Tokens.s8),
        Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Tokens.text300)),
      ]),
    );
  }
}
