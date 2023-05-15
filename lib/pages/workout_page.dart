import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/components/bottomNav.dart';
import 'package:provider_tut/data/workout_sessions.dart';
import 'package:provider_tut/classes/exercise_class.dart';

import '../classes/session_class.dart';
import '../classes/workout_class.dart';
import '../components/workout_info.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key, required this.session});

  final Session session;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  TextEditingController _controller = TextEditingController();

  void save() {
    String workoutName = _controller.text;
    // print(sessionName);
    if (workoutName == '') {
      Navigator.pop(context);
    } else {
      Workout workout = Workout(
        name: workoutName,
        exercise: [],
      );

      String sessionName = widget.session.name;
      int? sessionId = widget.session.sessionId;

      Provider.of<WorkoutSessions>(context, listen: false)
          .addWorkout(workout, sessionName, sessionId!);

      // print("Dialogue navigator: " + Navigator.defaultRouteName);
      _controller.clear();
      Navigator.pop(context);
    }

    // print("Dialogue navigator: " + Navigator.defaultRouteName);
  }

  void cancel() {
    Navigator.pop(context);
  }

  void addWorkout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Workout'),
          content: TextField(
            controller: _controller,
          ),
          actions: [
            MaterialButton(
              onPressed: save,
              child: Text("Save"),
            ),
            MaterialButton(
              onPressed: cancel,
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String?> navStack = [];
    var navigatorState = Navigator.of(context);
    for (var object in navigatorState.widget.pages) {
      navStack.add(object.name);
    }

    print("Workout Page Nav stack : ${navStack}");
    return Consumer<WorkoutSessions>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Session: ${widget.session.name}"),
          ),
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.session.workouts.length,
            itemBuilder: (context, index) {
              return WorkoutInfo(
                name: widget.session.workouts[index].name,
                names: widget.session.workouts[index].exercise,
                sessionId: widget.session.sessionId,
                sessionName: widget.session.name,
              );
              // return ListTile(
              //   title: Text(value.getSpecificWorkout(widget.name, index)),
              //   subtitle: Column(
              //     children: [
              //       Chip(
              //         label: Text(
              //             value.getExercise(widget.name, index)[index].name),
              //       )
              //     ],
              //   ),
              // );
            },
          ),
          bottomNavigationBar: const BottomNav(1),
          floatingActionButton: FloatingActionButton(
            onPressed: addWorkout,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     // automaticallyImplyLeading: true,
    //     title: const Text('WorkoutPage'),
    //   ),
    //   body: const Placeholder(),
    //   bottomNavigationBar: BottomNav(1),
    // );
  }
}
