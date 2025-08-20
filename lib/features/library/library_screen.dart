import 'package:flutter/material.dart';
import '../../theme/tokens.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: Padding(
        padding: const EdgeInsets.all(Tokens.s16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Programs', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: Tokens.s12),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.only(bottom: Tokens.s12),
                child: Container(
                  padding: const EdgeInsets.all(Tokens.s16),
                  decoration: BoxDecoration(
                    color: Tokens.bg800,
                    borderRadius: BorderRadius.circular(Tokens.r16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Program ${i + 1}',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
