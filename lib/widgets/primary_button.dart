import 'package:flutter/material.dart';
import '../theme/tokens.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool ghost;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.ghost = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: Tokens.s8),
        ],
        Text(label),
      ],
    );

    if (ghost) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Tokens.brand500),
          padding: const EdgeInsets.symmetric(
              horizontal: Tokens.s24, vertical: Tokens.s12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Tokens.r16)),
        ),
        child: child,
      );
    }

    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      child: loading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : child,
    );
  }
}