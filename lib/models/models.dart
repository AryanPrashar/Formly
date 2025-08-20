class Exercise {
  final String id;
  final String name;
  final String muscleGroup;
  final int sets;
  final int reps;
  final double weight;

  Exercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    this.sets = 3,
    this.reps = 10,
    this.weight = 0,
  });
}

class WorkoutPlan {
  final String id;
  final String name;
  final List<Exercise> exercises;

  WorkoutPlan({
    required this.id,
    required this.name,
    this.exercises = const [],
  });
}

class ScanMetric {
  final String label;
  final String value;
  final String target;
  final String severity;   // ok / caution / danger
  final String confidence; // low / med / high

  ScanMetric({
    required this.label,
    required this.value,
    required this.target,
    required this.severity,
    required this.confidence,
  });
}

class ChatMessage {
  final String id;
  final String text;
  final bool fromUser;

  ChatMessage({required this.id, required this.text, required this.fromUser});
}
