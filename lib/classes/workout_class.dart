import 'exercise_class.dart';

class Workout {
  final String name;
  final List<Exercice> exercise;

  Workout({required this.name, required this.exercise});

  int? sessionId;
  String sessionName = '';

  void attachSessionID(int id) {
    this.sessionId = id;
  }

  void attachSessionName(String sessionName) {
    this.sessionName = sessionName;
  }
}
