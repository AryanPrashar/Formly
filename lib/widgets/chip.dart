import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class StatusChip extends StatelessWidget {
  final String label;
  final String type; // ok / improve / caution / danger
  final String? confidence; // low/med/high optional

  const StatusChip({
    super.key,
    required this.label,
    this.type = 'ok',
    this.confidence,
  });

  Color _bg() {
    switch (type) {
      case 'danger':
        return Tokens.danger500.withOpacity(.15);
      case 'caution':
        return Tokens.warn500.withOpacity(.15);
      case 'ok':
        return Tokens.success500.withOpacity(.15);
      default:
        return Tokens.bg800;
    }
  }

  Color _fg() {
    switch (type) {
      case 'danger':
        return Tokens.danger500;
      case 'caution':
        return Tokens.warn500;
      case 'ok':
        return Tokens.success500;
      default:
        return Tokens.text300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Tokens.s12, vertical: Tokens.s8),
      decoration: BoxDecoration(
        color: _bg(),
        borderRadius: BorderRadius.circular(Tokens.r8),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(label, style: TextStyle(color: _fg())),
        if (confidence != null) ...[
          const SizedBox(width: Tokens.s8),
          Text('• $confidence', style: TextStyle(color: _fg())),
        ],
      ]),
    );
  }
}
