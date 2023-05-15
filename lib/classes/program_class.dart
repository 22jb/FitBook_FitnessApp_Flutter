import 'package:provider_tut/classes/session_class.dart';

class ProgramClass {
  final List<Session> sessions;
  final int duration;
  final int frequency;

  ProgramClass({
    required this.sessions,
    required this.duration,
    required this.frequency,
    required String programName,
  }) {
    // buildProgram(sessions, duration, frequency);
  }
  Map<int, List<Session?>> programSessions = {};

  void buildProgram() {
    // int timesPerWeek = frequency;
    // int numberOfWeeks = duration;
    // List<Session> workoutSessions = sessions;
    List<Session?> programSession =
        List.generate(frequency * duration, (index) => null);
    int sessionCounter = 0;
    int programCounter = 0;
    int programIndex = programSessions.length;

    for (var element in programSession) {
      if ((sessionCounter % sessions.length) == 0) {
        sessionCounter = 0;
      }
      programSession[programCounter] = sessions[sessionCounter];

      programCounter++;
      sessionCounter++;
    }
    // return programSession;

    programSessions[programIndex] = programSession;
  }
}
