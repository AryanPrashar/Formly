import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/tokens.dart';
import '../../widgets/primary_button.dart';

class CaptureReadyScreen extends StatelessWidget {
  const CaptureReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Fixer')),
      body: Stack(children: [
        // Camera placeholder background gradient
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A0A0A), Color(0xFF191919)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(Tokens.s16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(Tokens.s16),
                decoration: BoxDecoration(
                  color: Tokens.bg800.withOpacity(.75),
                  borderRadius: BorderRadius.circular(Tokens.r16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Frame your full body',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: Tokens.s8),
                    Text('Stand 0.5–1 m away. Keep knees & hips visible.',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Tokens.text300)),
                    const SizedBox(height: Tokens.s16),
                    PrimaryButton(
                      label: 'Start scan (10–15s)',
                      onPressed: () => context.go('/scan'),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
