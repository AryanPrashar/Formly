import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../theme/tokens.dart';
import '../../providers/app_providers.dart';
import '../../widgets/metric_card.dart';
import '../../widgets/primary_button.dart';

class AnalysisResultScreen extends ConsumerWidget {
  const AnalysisResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metrics = ref.watch(scanMetricsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Form Fixer Result')),
      body: Padding(
        padding: const EdgeInsets.all(Tokens.s16),
        child: ListView(children: [
          Container(
            padding: const EdgeInsets.all(Tokens.s16),
            decoration: BoxDecoration(
              color: Tokens.bg800,
              borderRadius: BorderRadius.circular(Tokens.r16),
            ),
            child: Row(children: [
              SizedBox(
                width: 72,
                height: 72,
                child: Stack(alignment: Alignment.center, children: [
                  const CircularProgressIndicator(
                    value: .82,
                    strokeWidth: 8,
                    color: Tokens.brand500,
                  ),
                  Text('82', style: Theme.of(context).textTheme.titleMedium),
                ]),
              ),
              const SizedBox(width: Tokens.s16),
              Expanded(
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Overall score',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Tokens.text300)),
                  Text('Good — 1 main fix',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text('Main cue: “Knees cave in”',
                      style: Theme.of(context).textTheme.bodySmall),
                ]),
              ),
            ]),
          ),
          const SizedBox(height: Tokens.s16),
          for (final m in metrics) ...[
            MetricCard(
              title: m.label,
              value: m.value,
              target: m.target,
              severity: m.severity,
              confidence: m.confidence,
            ),
            const SizedBox(height: Tokens.s12),
          ],
          const SizedBox(height: Tokens.s16),
          Container(
            padding: const EdgeInsets.all(Tokens.s16),
            decoration: BoxDecoration(
              color: Tokens.bg800,
              borderRadius: BorderRadius.circular(Tokens.r16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Main Fix', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: Tokens.s8),
                Text('Drive knees out on the descent. Try a 2-1-1 tempo.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Tokens.text300)),
                const SizedBox(height: Tokens.s12),
                PrimaryButton(
                  label: 'Add drill to plan',
                  onPressed: () => context.go('/workout'),
                ),
                const SizedBox(height: Tokens.s8),
                PrimaryButton(label: 'Share result', ghost: true, onPressed: () {}),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
