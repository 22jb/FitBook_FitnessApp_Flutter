import 'package:provider_tut/classes/workout_class.dart';

class Session {
  late final String name;
  final List<Workout> workouts;

  Session(
      {required this.sessionId, required this.name, required this.workouts});
  int? sessionId;
  Session.noId({required this.name, required this.workouts}) {
    sessionId = null;
  }

  get length => null;
}
