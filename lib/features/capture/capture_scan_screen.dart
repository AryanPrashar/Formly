import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/tokens.dart';
import '../../widgets/progress_sheet.dart';

class CaptureScanScreen extends StatefulWidget {
  const CaptureScanScreen({super.key});

  @override
  State<CaptureScanScreen> createState() => _CaptureScanScreenState();
}

class _CaptureScanScreenState extends State<CaptureScanScreen> {
  double p = 0;
  int reps = 0;

  @override
  void initState() {
    super.initState();
    // Simulate scanning progress
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 450));
      if (!mounted) return false;
      setState(() {
        p = (p + 0.1).clamp(0, 1);
        reps += 2;
      });
      if (p >= 1) {
        await Future.delayed(const Duration(milliseconds: 600));
        if (mounted) context.go('/result');
        return false;
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Positioned.fill(child: ColoredBox(color: Colors.black)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(Tokens.s16),
            child: ProgressSheet(
              title: 'Scanning…',
              progress: p,
              repsDone: reps,
              onCancel: () => context.go('/capture'),
            ),
          ),
        ),
      ]),
    );
  }
}
