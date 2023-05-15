import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/classes/workout_class.dart';
import 'package:provider_tut/classes/exercise_class.dart';
import 'package:provider_tut/components/exercice_info.dart';
import 'package:provider_tut/data/workout_sessions.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key, required this.workout});

  final Workout workout;
  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _repsController = TextEditingController();
  TextEditingController _setsController = TextEditingController();

  void save() {
    String exerciceName = _controller.text;
    String repsInput = _repsController.text;
    String setsInput = _setsController.text;
    print(exerciceName);
    if (exerciceName == '') {
      Navigator.pop(context);
    } else {
      Exercice exercice = Exercice(
        name: exerciceName,
        // reps: repsInput,
        sets: setsInput,
      );

      String sessionName = widget.workout.sessionName;
      int sessionId = widget.workout.sessionId!;
      String workoutName = widget.workout.name;

      Provider.of<WorkoutSessions>(context, listen: false)
          .addExercice(exercice, workoutName, sessionName, sessionId);

      // print("Dialogue navigator: " + Navigator.defaultRouteName);
      for (var element in widget.workout.exercise) {
        print("Exercises: ${element.name}");
      }
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
          title: const Text('Add Exercice'),
          content: Column(
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter Exercice Name",
                ),
              ),
              TextFormField(
                controller: _setsController,
                decoration: InputDecoration(
                  hintText: "Enter Sets",
                ),
              )
            ],
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

    print("Exercise Page Nav stack : ${navStack}");
    return Consumer<WorkoutSessions>(builder: (
      context,
      value,
      child,
    ) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Exercises: ${widget.workout.name}',
            // textAlign: TextAlign.end,
          ),
        ),
        body: Container(
          // color: Colors.blueAccent,
          padding: EdgeInsets.all(20.0),
          // alignment: Alignment.center,
          child: ListView.builder(
            itemCount: widget.workout.exercise.length,
            itemBuilder: (BuildContext context, int index) {
              int exerciseIndex = index;
              Exercice exercice = widget.workout.exercise[index];

              return ExerciceInfo(
                exercice: exercice,
                sessionId: widget.workout.sessionId,
                sessionName: widget.workout.sessionName,
                exerciceIndex: exerciseIndex,
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addWorkout();
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
