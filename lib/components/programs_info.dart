import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/classes/program_class.dart';

import '../classes/exercise_class.dart';
import '../classes/workout_class.dart';
import '../data/workout_sessions.dart';
import 'package:provider_tut/classes/exercise_class.dart';

class ProgramsInfo extends StatefulWidget {
  const ProgramsInfo({super.key, required this.programClass});

  final List<ProgramClass>? programClass;
  // int duration;
  // int frequency;
  // int numOfSession;
  @override
  State<ProgramsInfo> createState() => _ProgramsInfoState();
}

class _ProgramsInfoState extends State<ProgramsInfo> {
  // List<int> userWeightInput = [];
  // List<int> userRepsInput = [];

  // void updateDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       final formKey = GlobalKey<FormState>();

  //       List<TextEditingController> weightInputControllers = List.generate(
  //         int.parse(widget.exercice.sets),
  //         (index) {
  //           print(index);
  //           return TextEditingController();
  //         },
  //       );
  //       List<TextEditingController> repsInputControllers = List.generate(
  //         int.parse(widget.exercice.sets),
  //         (index) {
  //           print(index);
  //           return TextEditingController();
  //         },
  //       );

  //       return AlertDialog(
  //         title: Text('Edit Weight'),
  //         content: Container(
  //           width: double.maxFinite,
  //           child: Form(
  //             key: formKey,
  //             child: ListView.builder(
  //               shrinkWrap: true,
  //               itemCount: int.parse(widget.exercice.sets),
  //               itemBuilder: (context, index) {
  //                 return Wrap(
  //                   children: [
  //                     SizedBox(
  //                       width: 130,
  //                       child: TextFormField(
  //                         validator: (value) {
  //                           if (value == null || value.isEmpty) {
  //                             return 'Please enter some text';
  //                           }
  //                           return null;
  //                         },
  //                         controller: weightInputControllers[index],
  //                         decoration: InputDecoration(
  //                             hintText: "Enter weight for set: ${index + 1}"),
  //                         style: TextStyle(
  //                           fontSize: 13,
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 20,
  //                     ),
  //                     SizedBox(
  //                       width: 130,
  //                       child: TextFormField(
  //                         validator: (value) {
  //                           if (value == null || value.isEmpty) {
  //                             return 'Please enter some text';
  //                           }
  //                           return null;
  //                         },
  //                         controller: repsInputControllers[index],
  //                         decoration: InputDecoration(
  //                             hintText: "Enter reps for set: ${index + 1}"),
  //                         style: TextStyle(fontSize: 13),
  //                       ),
  //                     ),
  //                   ],
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //         actions: [
  //           MaterialButton(
  //             onPressed: () {
  //               List<int> userInputs = [];
  //               List<int> userReps = [];
  //               print("lol ? : ${userWeightInput.length}");
  //               print("Current State ${formKey.currentState?.validate()}");
  //               if (formKey.currentState!.validate()) {
  //                 ScaffoldMessenger.of(context)
  //                     .showSnackBar(const SnackBar(content: Text('Updating')));
  //                 for (int i = 0; i < weightInputControllers.length; i++) {
  //                   userInputs.add(int.parse(weightInputControllers[i].text));
  //                 }
  //                 userWeightInput = (userInputs);

  //                 for (int i = 0; i < repsInputControllers.length; i++) {
  //                   userReps.add(int.parse(repsInputControllers[i].text));
  //                 }
  //                 userRepsInput = (userReps);

  //                 // ignore: avoid_print
  //               }
  //               print(" inputs: ${userWeightInput}");
  //               updateWeight(userWeightInput);
  //               print("Here weights: ${widget.exercice.weights}");
  //               updateReps(userRepsInput);
  //               print("Here reps: ${widget.exercice.reps}");
  //               Navigator.pop(context);
  //             },
  //             child: Text("Save"),
  //           ),
  //           MaterialButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text("Cancel"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void updateWeight(List<int> value) {
  //   Exercice exercice = widget.exercice;
  //   String sessionName = widget.sessionName;
  //   int? sessionId = widget.sessionId;
  //   int exerciceIndex = widget.exerciceIndex;
  //   exercice.addWeight(value);
  //   Provider.of<WorkoutSessions>(context, listen: false).updateWeight(
  //       exercice, exercice.name, sessionName, sessionId, exerciceIndex);
  // }

  // void updateReps(List<int> value) {
  //   Exercice exercice = widget.exercice;
  //   String sessionName = widget.sessionName;
  //   int? sessionId = widget.sessionId;
  //   int exerciceIndex = widget.exerciceIndex;
  //   exercice.addReps(value);
  //   print("reps: ${exercice.reps}");
  //   print("weights: ${exercice.weights}");
  //   Provider.of<WorkoutSessions>(context, listen: false).updateWeight(
  //       exercice, exercice.name, sessionName, sessionId, exerciceIndex);
  // }

  @override
  Widget build(BuildContext context) {
    // String sets = widget.exercice.sets;
    // String reps = widget.exercice.reps;

    // if(exercice.weights.length)
    return Card(
      child: LimitedBox(
        maxHeight: 200,
        maxWidth: 200,
        // constraints: const BoxConstraints.expand(),
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            //   Expanded(
            //     flex: 10,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Expanded(
            //           child: Center(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text("${widget.exercice.name}"),
            //                 Text("${sets} sets "),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           child: ListView.builder(
            //               padding: EdgeInsets.all(8),
            //               itemCount: int.parse(sets),
            //               // separatorBuilder: (context, index) {
            //               //   return Container(
            //               //     // color: Colors.amber,
            //               //     child: SizedBox(
            //               //       height: ,
            //               //     ),
            //               // );
            //               // },
            //               itemBuilder: (context, index) {
            //                 int currSet = index + 1;
            //                 List<int>? weight = widget.exercice.weights;
            //                 String? weightIndex;
            //                 if (weight != null) {
            //                   weightIndex = weight[index].toString();
            //                   print("showing weight index: $weightIndex");
            //                 }

            //                 if (weight == null) {
            //                   // return Text("Weight: Empty");
            //                   return Column(
            //                     children: [
            //                       // Text("Sets: ${currSet}"),
            //                       // SizedBox(
            //                       //   height: 1,
            //                       // ),
            //                       SizedBox(
            //                         height: 30,
            //                         child: TextFormField(
            //                           textAlign: TextAlign.center,
            //                           decoration: InputDecoration(
            //                               hintText: "Enter Weight"),
            //                           style: TextStyle(
            //                             fontSize: 15,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   );
            //                 } else {
            //                   print("else trigger weight list: ${weight}");
            //                   return Column(
            //                     children: [
            //                       // Text("Sets: ${currSet}"),
            //                       // SizedBox(
            //                       //   height: 1,
            //                       // ),
            //                       SizedBox(
            //                         height: 30,
            //                         child: TextFormField(
            //                           textAlign: TextAlign.center,
            //                           decoration: InputDecoration(
            //                               hintText: "Weight: $weightIndex "),
            //                           style: TextStyle(
            //                             fontSize: 15,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   );
            //                   // return Text(
            //                   //     "Weight: ${widget.exercice.weights?[index]}");
            //                 }
            //               }),
            //         ),
            //         Expanded(
            //             child: ListView.builder(
            //                 padding: EdgeInsets.all(8),
            //                 itemCount: int.parse(sets),
            //                 itemBuilder: (context, index) {
            //                   int currSet = index + 1;
            //                   List<int>? reps = widget.exercice.reps;
            //                   String? repIndex;
            //                   if (reps != null) {
            //                     repIndex = reps[index].toString();
            //                     print("showing rep index: $repIndex");
            //                   }
            //                   if (reps == null) {
            //                     return Column(
            //                       children: [
            //                         SizedBox(
            //                           height: 30,
            //                           child: TextFormField(
            //                             textAlign: TextAlign.center,
            //                             decoration: InputDecoration(
            //                                 hintText: "Enter Reps"),
            //                             style: TextStyle(
            //                               fontSize: 15,
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     );
            //                   } else {
            //                     print("else trigger reps list: ${reps}");
            //                     return Column(
            //                       children: [
            //                         // Text("Sets: ${currSet}"),
            //                         // SizedBox(
            //                         //   height: 1,
            //                         // ),
            //                         SizedBox(
            //                           height: 30,
            //                           child: TextFormField(
            //                             textAlign: TextAlign.center,
            //                             decoration: InputDecoration(
            //                                 hintText: "Reps: $repIndex "),
            //                             style: TextStyle(
            //                               fontSize: 15,
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     );
            //                     // return Text(
            //                     //     "Weight: ${widget.exercice.reps?[index]}");
            //                   }
            //                 }))
            //       ],
            //     ),
            //   ),
            //   Expanded(
            //     flex: 1,
            //     child: Container(
            //       color: Colors.black12,
            //       alignment: Alignment.bottomRight,
            //       margin: EdgeInsets.only(right: 0),
            //       child: ElevatedButton(
            //           onPressed: updateDialog,
            //           child: const Text(
            //             "Update",
            //             textAlign: TextAlign.end,
            //           )),
            //     ),
            //   ),
            // ],
            ),
      ),
    );
  }
}
