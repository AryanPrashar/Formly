import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';

/// Demo workout state (in-memory). Swap to repository later.
final workoutProvider =
    StateNotifierProvider<WorkoutNotifier, WorkoutPlan>((ref) {
  return WorkoutNotifier();
});

class WorkoutNotifier extends StateNotifier<WorkoutPlan> {
  WorkoutNotifier()
      : super(WorkoutPlan(id: 'w1', name: 'Push Day', exercises: [
          Exercise(
              id: 'e1',
              name: 'Barbell Bench Press',
              muscleGroup: 'Chest',
              sets: 3,
              reps: 8,
              weight: 60),
          Exercise(
              id: 'e2',
              name: 'Incline DB Press',
              muscleGroup: 'Chest',
              sets: 3,
              reps: 10,
              weight: 20),
          Exercise(
              id: 'e3',
              name: 'Shoulder Press',
              muscleGroup: 'Shoulders',
              sets: 3,
              reps: 10,
              weight: 25),
        ]));

  void addExercise(Exercise e) {
    final list = [...state.exercises, e];
    state = WorkoutPlan(id: state.id, name: state.name, exercises: list);
  }
}

/// Demo metrics used by Result screen.
final scanMetricsProvider = Provider<List<ScanMetric>>((ref) => [
      ScanMetric(
          label: 'Range of Motion',
          value: '90°',
          target: '100–120°',
          severity: 'caution',
          confidence: 'med'),
      ScanMetric(
          label: 'Knee Valgus',
          value: '8°',
          target: '< 5°',
          severity: 'danger',
          confidence: 'high'),
      ScanMetric(
          label: 'Tempo',
          value: '3-0-1',
          target: '2-1-1',
          severity: 'ok',
          confidence: 'low'),
    ]);

final chatProvider =
    StateNotifierProvider<ChatNotifier, List<ChatMessage>>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  ChatNotifier()
      : super([
          ChatMessage(
            id: 'bot1',
            text:
                "Hey! I’m your Formly coach. What are we training today?",
            fromUser: false,
          )
        ]);

  void send(String text) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    state = [
      ...state,
      ChatMessage(id: id, text: text, fromUser: true),
    ];
    // Simple bot reply (replace with real AI):
    state = [
      ...state,
      ChatMessage(
          id: 'bot$id',
          text: 'Got it. Try 3×10 at RPE 8 and keep core braced.',
          fromUser: false),
    ];
  }
}
