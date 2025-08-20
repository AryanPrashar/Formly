import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';
import '../../theme/tokens.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final ctrl = TextEditingController();
  int messagesThisWeek = 0;

  @override
  Widget build(BuildContext context) {
    final msgs = ref.watch(chatProvider);
    final canSend = messagesThisWeek < 10;

    return Scaffold(
      appBar: AppBar(title: const Text('Coach')),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(Tokens.s16),
            itemCount: msgs.length,
            itemBuilder: (_, i) {
              final m = msgs[i];
              final bubbleColor =
                  m.fromUser ? Tokens.brand500.withOpacity(.2) : Tokens.bg800;
              return Align(
                alignment:
                    m.fromUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: Tokens.s8),
                  padding: const EdgeInsets.all(Tokens.s12),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: BorderRadius.circular(Tokens.r16),
                  ),
                  child: Text(m.text),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(Tokens.s16, 0, Tokens.s16, Tokens.s16),
          child: Row(children: [
            Expanded(child: TextField(controller: ctrl, decoration: const InputDecoration(hintText: 'Ask your coach…'))),
            const SizedBox(width: Tokens.s8),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                if (!canSend) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Unlock unlimited chat'),
                      content: const Text('You used your 10 free messages. Upgrade to continue.'),
                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Later'))],
                    ),
                  );
                  return;
                }
                if (ctrl.text.trim().isEmpty) return;
                ref.read(chatProvider.notifier).send(ctrl.text.trim());
                setState(() => messagesThisWeek++);
                ctrl.clear();
              },
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: Tokens.s8),
          child: Text(
            '${10 - messagesThisWeek} free messages left',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Tokens.text500),
          ),
        ),
      ]),
    );
  }
}
