import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider_tut/classes/exercise_class.dart';
import 'package:provider_tut/classes/workout_class.dart';

import '../classes/session_class.dart';

class WorkoutSessions extends ChangeNotifier {
  // List<int> sessionIds = [0];
  Map<int, List<Session>> sessions = {
    0: [
      Session(
          name: 'Wednesday Session',
          workouts: [
            Workout(
              name: '5x5-recovery',
              exercise: [
                Exercice(name: "Squats", sets: "4"),
                Exercice(name: "Bench", sets: "4"),
                Exercice(name: "Deadlift", sets: "4"),
              ],
            ),
          ],
          sessionId: 0),
      Session(
          name: 'Friday Session',
          workouts: [
            Workout(
              name: '5x5-pr',
              exercise: [
                Exercice(name: "Squat", sets: "6"),
                Exercice(name: "DeadLifts", sets: "6"),
                Exercice(name: "Barbell Row", sets: "6"),
              ],
            ),
          ],
          sessionId: 1)
    ]
  };

  // List<Workout> getWorkoutList(String sessionName, int sessionId) {
  //   List<Workout> workoutList = [];
  //   sessions.Each((key, value) {
  //     for (Session element in value) {
  //       if (element.name == sessionName) {
  //         workoutList = element.workouts;
  //       }
  //     }
  //   });
  //   // print('print: ' + ${workoutList});
  //   return workoutList;
  // }

  // Workout getSpecificWorkout(String sessionName, int index) {
  //   List<Workout> workouts = getWorkoutList(sessionName);
  //   return workouts[index];
  // }

  void addSession(Session newSession) {
    String newSessionName = newSession.name;
    int? newSessionId = newSession.sessionId;

    if (!sessions.keys.contains(newSessionId)) {
      sessions[newSessionId!] = [];
    } else if (sessions.keys.contains(newSessionId)) {
      sessions[newSessionId]?.add(newSession);
      // print(sessions[sessionId]);
      print(newSession);
    }
    notifyListeners();
    // print('testing...');
  }

  void addWorkout(Workout newWorkout, String sessionsName, int sessionId) {
    for (var element in sessions[sessionId]!) {
      if (element.name == sessionsName) {
        element.workouts.add(newWorkout);
      }
    }
    // sessions[sessionId];
    notifyListeners();
  }

  void deleteWorkout(String workoutName, int sessionId, String sessionName) {
    print("workout name: " + workoutName);
    print("session name: " + sessionName);

    for (var sessionElement in sessions[sessionId]!) {
      if (sessionElement.name == sessionName) {
        // for (var workouts in sessionElement.workouts) {
        //   if (workouts.name == workoutName) {
        //     print("found list ${workouts.name}");
        //     // sessionElement.workouts.remove(workouts);
        // }
        // }
        for (var element in sessionElement.workouts) {
          print(element.name);
        }
        sessionElement.workouts
            .removeWhere((element) => element.name == workoutName);
      }
      print("sessions: ${sessions[sessionId]}");
    }
    notifyListeners();
  }

  Session? getSession(String name, int id) {
    String targetName = name;
    Session targetSession;
    List<Session>? sessionsList = sessions[id];
    print("name: ${name}, id: ${id}");
    print(sessionsList);

    for (var element in sessionsList!) {
      if (element.name == targetName) {
        targetSession = element;
        return targetSession;
      }
    }
  }

  // Exercise? getE

  // Workout(
  //             name: 'Back',
  //             exercise: [
  //               Exercise(name: "DeadLifts", reps: "5", sets: "5"),
  //               Exercise(name: "Barbell Row", reps: "5", sets: "5"),
  //             ],
  Workout? getWorkout(int sessionId, String sessionName, String targetWorkout) {
    List<Session>? sessionsList = sessions[sessionId];
    for (Session sessionElement in sessionsList!) {
      if (sessionElement.name == sessionName) {
        for (Workout workoutElement in sessionElement.workouts) {
          if (workoutElement.name == targetWorkout) {
            return workoutElement;
          }
        }
      }
    }
  }

  void updateWeight(
      exercice, workoutName, sessionName, sessionId, exerciceIndex) {
    List<int>? newExercice;
    for (var session in sessions[sessionId]!) {
      if (session.name == sessionName) {
        for (var workout in session.workouts) {
          if (workout.name == workoutName) {
            newExercice = exercice;
            workout.exercise[exerciceIndex] = exercice;
          }
        }
      }
    }
    notifyListeners();
    // print("This is the new exercice class: $newExercice");
  }

  // void updateReps(){

  // }

  void addExercice(exercice, workoutName, sessionName, sessionId) {
    Exercice newExercice = exercice;
    print("workout name: ${workoutName}");
    print("session name: ${sessionName}");
    Workout? w;
    for (Session session in sessions[sessionId]!) {
      if (session.name == sessionName) {
        for (Workout workout in session.workouts) {
          print("curr workout: ${workout.name}");
          if (workout.name == workoutName) {
            w = workout;
            workout.exercise.add(exercice);
          }
        }
      }
    }
    notifyListeners();
    if (w != null) {
      print("adding exercices ${w.exercise}");
    }
  }
}
