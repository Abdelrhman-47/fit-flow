class PlanModel {
  final String id;
  final String goal;
  final int daysPerWeek;
  final String title;
  final List<DayModel> days;

  PlanModel({
    required this.id,
    required this.goal,
    required this.daysPerWeek,
    required this.title,
    required this.days,
  });

  factory PlanModel.fromMap(Map<String, dynamic> map, String id) {
    return PlanModel(
      id: id,
      goal: map['goal'] ?? '',
      daysPerWeek: map['days_per_week'] ?? 0,
      title: map['title'] ?? '',
      days: List<DayModel>.from(
        (map['days'] as List).map((x) => DayModel.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'goal': goal,
      'days_per_week': daysPerWeek,
      'title': title,
      'days': days.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'PlanModel(id: $id, title: $title, goal: $goal, daysPerWeek: $daysPerWeek, days: $days)';
  }
}

class DayModel {
  final int day;
  final String name;
  final List<ExerciseModel> exercises;

  DayModel({
    required this.day,
    required this.name,
    required this.exercises,
  });

  factory DayModel.fromMap(Map<String, dynamic> map) {
    return DayModel(
      day: map['day'] ?? 0,
      name: map['name'] ?? '',
      exercises: List<ExerciseModel>.from(
        (map['exercises'] as List).map((x) => ExerciseModel.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'name': name,
      'exercises': exercises.map((x) => x.toMap()).toList(),
    };
  }

  @override
  String toString() {
    return 'DayModel(day: $day, name: $name, exercises: $exercises)';
  }
}

class ExerciseModel {
  final String name;
  final int sets;
  final String reps;

  ExerciseModel({
    required this.name,
    required this.sets,
    required this.reps,
  });

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['name'] ?? '',
      sets: map['sets'] ?? 0,
      reps: map['reps'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sets': sets,
      'reps': reps,
    };
  }

  @override
  String toString() {
    return 'ExerciseModel(name: $name, sets: $sets, reps: $reps)';
  }
}
