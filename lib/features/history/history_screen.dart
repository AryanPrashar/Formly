import 'package:flutter/material.dart';
import '../../theme/tokens.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: ListView.builder(
        padding: const EdgeInsets.all(Tokens.s16),
        itemCount: 10,
        itemBuilder: (_, i) => Container(
          margin: const EdgeInsets.only(bottom: Tokens.s12),
          padding: const EdgeInsets.all(Tokens.s16),
          decoration: BoxDecoration(
            color: Tokens.bg800,
            borderRadius: BorderRadius.circular(Tokens.r16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Session ${i + 1}',
                  style: Theme.of(context).textTheme.bodyMedium),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
