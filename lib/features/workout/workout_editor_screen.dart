import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';
import '../../widgets/exercise_row.dart';
import '../../widgets/primary_button.dart';
import '../../theme/tokens.dart';
import '../../models/models.dart';

class WorkoutEditorScreen extends ConsumerWidget {
  const WorkoutEditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = ref.watch(workoutProvider);
    return Scaffold(
      appBar: AppBar(title: Text(plan.name)),
      body: Padding(
        padding: const EdgeInsets.all(Tokens.s16),
        child: Column(children: [
          Expanded(
            child: ListView.separated(
              itemCount: plan.exercises.length,
              separatorBuilder: (_, __) => const SizedBox(height: Tokens.s12),
              itemBuilder: (_, i) =>
                  ExerciseRow(exercise: plan.exercises[i]),
            ),
          ),
          const SizedBox(height: Tokens.s12),
          PrimaryButton(
            label: 'Add Exercise',
            onPressed: () {
              ref.read(workoutProvider.notifier).addExercise(
                    Exercise(
                      id: DateTime.now().toString(),
                      name: 'Goblet Squat',
                      muscleGroup: 'Legs',
                      sets: 3,
                      reps: 12,
                      weight: 20,
                    ),
                  );
            },
          ),
        ]),
      ),
    );
  }
}
