import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class ProgressSheet extends StatelessWidget {
  final String title;
  final double progress; // 0..1
  final int repsDone;
  final VoidCallback onCancel;

  const ProgressSheet({
    super.key,
    required this.title,
    required this.progress,
    required this.repsDone,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Tokens.bg800,
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(Tokens.r24)),
        boxShadow: Tokens.elevation8,
      ),
      padding: const EdgeInsets.all(Tokens.s16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            TextButton(onPressed: onCancel, child: const Text('Cancel')),
          ]),
          const SizedBox(height: Tokens.s16),
          LinearProgressIndicator(value: progress, minHeight: 6),
          const SizedBox(height: Tokens.s12),
          Text('Reps detected: $repsDone',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Tokens.text300)),
        ],
      ),
    );
  }
}
