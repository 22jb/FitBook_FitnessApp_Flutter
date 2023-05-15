import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../classes/exercise_class.dart';
import '../classes/workout_class.dart';
import '../data/workout_sessions.dart';

class WorkoutInfo extends StatelessWidget {
  WorkoutInfo({
    super.key,
    required this.names,
    required this.name,
    required this.sessionId,
    required this.sessionName,
    // this.sets,
    // this.reps,
  });
  final List<Exercice> names;
  final String name;
  final int? sessionId;
  final String sessionName;
  String sets = '';
  String reps = '';

  String getSets(int index) {
    sets = names[index].sets;
    // print('showingsets');
    return sets;
  }

  // String getReps(int index) {
  //   reps = names[index].reps;
  //   // print('showingreps');
  //   return reps;
  // }

  void delete(context) {
    Provider.of<WorkoutSessions>(context, listen: false)
        .deleteWorkout(name, sessionId!, sessionName);
  }

  void expand(context) {
    print("expanding: ${[sessionId, sessionName, name]}");

    Workout? currWorkout = Provider.of<WorkoutSessions>(context, listen: false)
        .getWorkout(sessionId!, sessionName, name);

    if (currWorkout == null) {
      return;
    } else {
      currWorkout.attachSessionID(sessionId!);
      currWorkout.attachSessionName(sessionName);
      print("helooo  :${currWorkout.sessionName}");
      print(currWorkout == null);
    }

    // context.push('/session/workout/exercise');
    print("workout appearing as: ${currWorkout.toString()}");
    print("workout session name: ${currWorkout.sessionName}");
    GoRouter.of(context).push('/session/workout/exercise', extra: currWorkout);
    // Exercise(name: name, reps: reps, sets: sets);
  }
  // void onTriggerCheck(String workout, String exercise) {
  //   Provider.of<WorkoutSessions>(context, listen: false)
  //       .checkOffExercise(workout, exercise);

  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 72, 109, 151),
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: 200,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Text(name),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            // shrinkWrap: false,
                            itemCount: names.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 60,
                                child: ListTile(
                                  title: Text(
                                    names[index].name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Chip(
                                        label: Text("${getSets(index)} sets"),
                                        labelStyle:
                                            const TextStyle(fontSize: 10),
                                      ),
                                      // Chip(
                                      //   label: Text("${getReps(index)} reps"),
                                      //   labelStyle:
                                      //       const TextStyle(fontSize: 10),
                                      // )
                                    ],
                                  ),
                                  // trailing: Checkbox(
                                  //   value: isDone,
                                  //   onChanged: (value) =>
                                  //       onTriggerCheck!(value),
                                  // ),
                                ),
                              );
                            },
                            // ListTile(title: Text(name)),
                            // Text(sets),
                            // Text(reps),
                          ),
                        ),
                      ],
                    )
                    // SizedBox(
                    //   child: Padding(
                    //     padding: EdgeInsets.all(20),
                    //   ),
                    // ),
                    ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: IconButton(
                      // iconSize: 2,
                      icon: Icon(
                        Icons.expand,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        expand(context);
                      },
                    ),
                  ),
                  // SizedBox(),
                  Flexible(
                    child: IconButton(
                      // iconSize: 2,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white70,
                      ),
                      onPressed: () => delete(context),
                    ),
                  ),
                ],
              ),
              // MainAxisAlignment: M
            ],
          ),
        ),
      ),
    );
  }
}
