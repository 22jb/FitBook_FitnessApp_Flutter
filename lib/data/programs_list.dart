import 'package:flutter/material.dart';
import 'package:provider_tut/classes/exercise_class.dart';
import 'package:provider_tut/classes/session_class.dart';
import 'package:provider_tut/classes/workout_class.dart';

import '../classes/program_class.dart';

class ProgramsList extends ChangeNotifier {
  Map<int, List<ProgramClass>> programs = {
    // 0: [
    //   ProgramClass(
    //     programName: "MadCow",
    //     duration: 4,
    //     frequency: 3,
    //     sessions: [
    //       Session.noId(name: "Monday Session", workouts: [
    //         Workout(name: "FullBody", exercise: [
    //           Exercice(name: "Squats", sets: "5"),
    //           Exercice(name: "Bench", sets: "5"),
    //           Exercice(name: "Rows", sets: "5"),
    //         ]),
    //       ]),
    //       Session.noId(name: "Wednesday Session", workouts: [
    //         Workout(name: "FullBody", exercise: [
    //           Exercice(name: "Squats", sets: "4"),
    //           Exercice(name: "Overhead Press", sets: "4"),
    //           Exercice(name: "Deadlift", sets: "4"),
    //         ]),
    //       ]),
    //       Session.noId(name: "Friday Session", workouts: [
    //         Workout(name: "FullBody", exercise: [
    //           Exercice(name: "Squats", sets: "6"),
    //           Exercice(name: "Bench", sets: "6"),
    //           Exercice(name: "Rows", sets: "6"),
    //         ]),
    //       ])
    //     ],
    //   )
    // ]
  };
}
