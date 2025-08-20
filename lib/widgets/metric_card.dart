import 'package:flutter/material.dart';
import '../theme/tokens.dart';
import 'chip.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String target;
  final String severity;
  final String confidence;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.target,
    required this.severity,
    required this.confidence,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Tokens.s16),
      decoration: BoxDecoration(
        color: Tokens.bg800,
        borderRadius: BorderRadius.circular(Tokens.r16),
        boxShadow: Tokens.elevation2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Tokens.text300)),
          const SizedBox(height: Tokens.s8),
          Text(value, style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: Tokens.s8),
          Row(children: [
            StatusChip(
              label: severity == 'ok'
                  ? 'OK'
                  : (severity == 'danger' ? 'Fix' : 'Improve'),
              type: severity,
              confidence: confidence,
            ),
            const SizedBox(width: Tokens.s12),
            Text('Target: $target',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Tokens.text500)),
          ]),
        ],
      ),
    );
  }
}
