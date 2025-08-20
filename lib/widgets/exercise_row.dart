import 'package:flutter/material.dart';
import '../theme/tokens.dart';
import '../models/models.dart';

class ExerciseRow extends StatelessWidget {
  final Exercise exercise;
  const ExerciseRow({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Tokens.s16),
      decoration: BoxDecoration(
        color: Tokens.bg800,
        borderRadius: BorderRadius.circular(Tokens.r16),
      ),
      child: Row(children: [
        const Icon(Icons.drag_handle),
        const SizedBox(width: Tokens.s12),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(exercise.name,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('${exercise.sets}×${exercise.reps}  •  ${exercise.muscleGroup}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Tokens.text500)),
          ]),
        ),
        const SizedBox(width: Tokens.s12),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Tokens.s12, vertical: Tokens.s8),
          decoration: BoxDecoration(
            border: Border.all(color: Tokens.brand500),
            borderRadius: BorderRadius.circular(Tokens.r8),
          ),
          child:
              Text('${exercise.weight} kg', style: const TextStyle(color: Tokens.brand500)),
        ),
      ]),
    );
  }
}
