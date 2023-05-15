import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/classes/exercise_class.dart';
import 'package:provider_tut/classes/session_class.dart';
import 'package:provider_tut/components/bottomNav.dart';
import 'package:provider_tut/data/programs_list.dart';
import 'package:provider_tut/data/workout_sessions.dart';

import '../classes/program_class.dart';
import '../classes/workout_class.dart';
import '../components/programs_info.dart';

class ProgramBuilderPage extends StatefulWidget {
  const ProgramBuilderPage({Key? key}) : super(key: key);

  @override
  _ProgramBuilderPageState createState() => _ProgramBuilderPageState();
}

class _ProgramBuilderPageState extends State<ProgramBuilderPage>
    with AutomaticKeepAliveClientMixin {
  late int clicked;
  late String _test;
  late String programName;
  int? sessionsCount;
  late String programFreq;
  late String programDuration;
  late List<String?> sessionNameInput;
  late List<String?> workoutNumsInput;
  late List<List<String?>> workoutNamesInput;
  late List<List<String?>> exerciceNumsInput;
  late int currCounter;
  late List<List<dynamic>> exerciceInputs;
  late List<List<dynamic>> setsInput;
  late List<Session> programSession;
  late ProgramClass programData;
  // late String

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    programFreq = "";
    programName = "";
    _test = "HI";
    clicked = 0;
    currCounter = 0;
    programFreq = "";
    programDuration = "";
    sessionNameInput = [];
    workoutNumsInput = [];
    workoutNamesInput = [];
    exerciceNumsInput = [];
    exerciceInputs = [];
    setsInput = [];
    // programData = [];
    programSession = [];
    print("current test: ${_test}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ProgramBuilderPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Updated!!!!!!!!!!!!!!!!!!!!!!!");
  }

  void createProgram() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        final formKey = GlobalKey<FormState>();
        // final sessionFormKey = GlobalKey<FormState>();
        print("Global for key: ${formKey.toString()}");
        // String localvar = _test;
        TextEditingController programNameController = TextEditingController();
        TextEditingController durationController = TextEditingController();
        TextEditingController frequencyController = TextEditingController();
        TextEditingController numOfSessionsController = TextEditingController();

        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            super.build(context);

            return Dialog.fullscreen(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Container(
                  alignment: Alignment.center,
                  // color: Color.fromARGB(255, 75, 105, 156),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: LimitedBox(
                        maxWidth: double.infinity,
                        maxHeight: double.infinity,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //welcome text container
                            Visibility(
                              visible: (clicked < 2),
                              child: Container(
                                // color: Colors.amber,
                                padding: EdgeInsets.all(20.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Welcome to ProBuilder",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            //Enter Program Name Textfield container
                            Visibility(
                              visible: (clicked < 2),
                              child: Container(
                                child: Center(
                                  child: SizedBox(
                                    // height: 30,
                                    width: 250,
                                    child: TextFormField(
                                      controller: programNameController,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        label: Text(
                                          "Please enter Program Name",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //duration/freq query text container
                            Visibility(
                              visible: (clicked < 2),
                              child: Container(
                                // color: Colors.amber,
                                padding: EdgeInsets.all(20.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Please enter program duration (number of weeks) and frequency (times in a week)",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            //Durations and Frequency TextField containers
                            Visibility(
                              visible: (clicked < 2),
                              child: Container(
                                // color: Colors.red,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                          controller: durationController,
                                          decoration: const InputDecoration(
                                              label: Text(
                                            "Enter Duration",
                                            textAlign: TextAlign.center,
                                          )),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                          controller: frequencyController,
                                          decoration: const InputDecoration(
                                              label: Text(
                                            "Enter Frequency",
                                            textAlign: TextAlign.center,
                                          )),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //middle description
                            Visibility(
                              visible: (clicked < 2),
                              child: const Center(
                                child: Text(
                                    "Below you will design each workout session\n"
                                    "Sessions will Loop based on frequency\n"
                                    "How many workout sessions would you like to create?"),
                              ),
                            ),
                            //Number of sessions Text Field Container
                            Visibility(
                              visible: (clicked < 2),
                              child: Container(
                                child: SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    controller: numOfSessionsController,
                                    decoration: const InputDecoration(
                                      label: Text("Enter Number of Sessions",
                                          textAlign: TextAlign.center),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //Begin Program Builder button
                            // clicked ==0
                            Visibility(
                              visible: (clicked == 0),
                              child: Builder(builder: (context) {
                                return ElevatedButton(
                                  style: FilledButton.styleFrom(
                                      backgroundColor: Colors.grey),
                                  onPressed: () {
                                    print(
                                        "Current State ${formKey.currentState?.validate()}");
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        print("setting state: ${clicked}");
                                        clicked == 0
                                            ? clicked = 1
                                            : clicked = 0;
                                        programName =
                                            programNameController.text;
                                        sessionsCount = int.parse(
                                            numOfSessionsController.text);
                                        programFreq = frequencyController.text;
                                        programDuration =
                                            durationController.text;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Begin Program Builder",
                                    // selectionColor: Colors.grey,
                                  ),
                                );
                              }),
                            ),

                            //hidden content // program builder form//clicked ==1
                            Visibility(
                              visible: clicked == 1,
                              child: Builder(builder: (context) {
                                int numSessions =
                                    int.parse(numOfSessionsController.text);
                                List<String?> sessionNames =
                                    List.generate(numSessions, (index) => "");
                                List<String?> sessionWorkouts =
                                    List.generate(numSessions, (index) => "");

                                List<TextEditingController>
                                    sessionInputControllers =
                                    List.generate(numSessions, (index) {
                                  return TextEditingController();
                                });

                                List<TextEditingController>
                                    workoutInputControllers =
                                    List.generate(numSessions, (index) {
                                  return TextEditingController();
                                });

                                print(
                                    "Before: ${sessionNames} and ${sessionWorkouts}");
                                final key = GlobalKey<FormState>();
                                return Form(
                                  key: key,
                                  child: Column(
                                    children: [
                                      LimitedBox(
                                        maxHeight: 200,
                                        maxWidth: 200,
                                        child: ListView.builder(
                                          itemCount: numSessions,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            // final key = GlobalKey<FormState>();

                                            return Column(
                                              children: [
                                                Card(
                                                  margin: EdgeInsets.all(10),
                                                  // color: Colors.grey,
                                                  child: Wrap(
                                                    alignment: WrapAlignment
                                                        .spaceBetween,
                                                    //TextFormFields
                                                    children: [
                                                      SizedBox(),
                                                      //TextFormField for Session Name
                                                      SizedBox(
                                                        width: 150,
                                                        child: TextFormField(
                                                          controller:
                                                              sessionInputControllers[
                                                                  index],
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter some text';
                                                            }
                                                            return null;
                                                          },
                                                          style: TextStyle(
                                                              fontSize: 12.5),
                                                          decoration:
                                                              InputDecoration(
                                                                  label: Text(
                                                            "Session Name",
                                                            textAlign: TextAlign
                                                                .center,
                                                          )),
                                                          onSaved: (newValue) {
                                                            setState(
                                                              () {
                                                                sessionNames[
                                                                        index] =
                                                                    newValue;
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(),
                                                      //Enter Number of workout TextField
                                                      SizedBox(
                                                        width: 150,
                                                        child: TextFormField(
                                                          controller:
                                                              workoutInputControllers[
                                                                  index],
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter some text';
                                                            }
                                                            return null;
                                                          },
                                                          style: TextStyle(
                                                              fontSize: 12.5),
                                                          decoration:
                                                              InputDecoration(
                                                                  label: Text(
                                                            "Workouts per Session",
                                                            textAlign: TextAlign
                                                                .center,
                                                          )),
                                                          onSaved: (newValue) {
                                                            setState(() {
                                                              print(
                                                                  "Test workout value ${newValue}");
                                                              sessionWorkouts[
                                                                      index] =
                                                                  newValue;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox()
                                                    ],
                                                  ),
                                                ),
                                                // ElevatedButton(
                                                //     onPressed: () {},
                                                //     child: Text("sugar"))
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            List<String> name = [];
                                            List<int> works = [];

                                            if (key.currentState!.validate()) {
                                              setState(
                                                () {
                                                  print(
                                                      "session form state : ${key.currentState!.validate()}");
                                                  // clicked = 0;
                                                  for (int i = 0;
                                                      i < numSessions;
                                                      i++) {
                                                    sessionNames[i] =
                                                        sessionInputControllers[
                                                                i]
                                                            .text;
                                                    sessionWorkouts[i] =
                                                        workoutInputControllers[
                                                                i]
                                                            .text;
                                                  }
                                                  clicked = 2;
                                                  sessionNameInput =
                                                      sessionNames;
                                                  print(
                                                      "session names: ${sessionNameInput}");
                                                  workoutNumsInput =
                                                      sessionWorkouts;
                                                },
                                              );
                                              print(
                                                  "Obtained value for session name and workouts. Sessions: ${sessionNameInput} WorkoutNums: ${workoutNumsInput}");
                                            }
                                          },
                                          child: Text("Continue to workouts"))
                                    ],
                                  ),
                                );
                              }),
                            ),
                            //clicked ==2
                            Visibility(
                              visible: clicked == 2,
                              child: Builder(builder: (context) {
                                final formKey = GlobalKey<FormState>();
                                List<String?> sessionName = sessionNameInput;
                                List<String?> nWorkouts =
                                    workoutNumsInput; //number of workouts per session e.g morning workout, evening workout
                                int totalWorkouts = 0;
                                for (var element in nWorkouts) {
                                  int temp = int.parse(element!);
                                  totalWorkouts = totalWorkouts + temp;
                                }

                                print("total workouts: ${totalWorkouts}");
                                List<List<String?>> workoutNames =
                                    List.generate(sessionName.length, (index) {
                                  return [];
                                });

                                List<List<String?>> nExercices =
                                    List.generate(sessionName.length, (index) {
                                  return [];
                                });

                                print("workout empty: ${workoutNames}");
                                print("session name currently: ${sessionName}");

                                // var emptyExList = List.generate(
                                //     exList.length,
                                //     (i) => List.generate(
                                //         exList[i].length,
                                //         (j) => List.generate(
                                //             exList[i][j].length, (k) => "")));
                                return Form(
                                    key: formKey,
                                    child: Column(
                                      children: [
                                        LimitedBox(
                                          maxHeight: 400,
                                          maxWidth: 400,
                                          child: ListView.builder(
                                            itemCount: sessionName.length,
                                            itemBuilder: (BuildContext context,
                                                int sessionIndex) {
                                              print("n workouts: ${nWorkouts}");

                                              return Column(
                                                children: [
                                                  //title
                                                  Text(
                                                      "Session: ${sessionName[sessionIndex]}"),
                                                  Card(
                                                    child: LimitedBox(
                                                      maxHeight: 100,
                                                      maxWidth: 100,
                                                      child: ListView.builder(
                                                        itemCount: int.parse(
                                                            nWorkouts[
                                                                sessionIndex]!),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(),
                                                                //Name of workouts text field
                                                                SizedBox(
                                                                  width: 150,
                                                                  child:
                                                                      TextFormField(
                                                                    onSaved:
                                                                        (newValue) {
                                                                      workoutNames[
                                                                              sessionIndex]
                                                                          .add(
                                                                              newValue);
                                                                      print(
                                                                          "Adding Value ${newValue} for session: ${sessionIndex + 1}...${workoutNamesInput}");
                                                                    },
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please enter some text';
                                                                      }
                                                                      return null;
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                            label:
                                                                                Text(
                                                                      "Enter Workout ${index + 1}'s name",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    )),
                                                                  ),
                                                                ),
                                                                // number of exercices text field
                                                                SizedBox(
                                                                  width: 150,
                                                                  child:
                                                                      TextFormField(
                                                                    onSaved:
                                                                        (newValue) {
                                                                      nExercices[
                                                                              sessionIndex]
                                                                          .add(
                                                                              newValue);
                                                                    },
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10),
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please enter some text';
                                                                      }
                                                                      return null;
                                                                    },
                                                                    // controller:
                                                                    //     numOfExercicesController[
                                                                    //         index],
                                                                    decoration:
                                                                        InputDecoration(
                                                                      label:
                                                                          Text(
                                                                        "Number of Exercises for workout: ${index + 1}",
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox()
                                                              ]);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              formKey.currentState!.save();
                                              setState(() {
                                                clicked = 3;
                                                print("clicked: ${clicked}");
                                                print(
                                                    "workouts: ${workoutNames}");
                                                print(
                                                    "exercices: ${nExercices}");
                                                workoutNamesInput =
                                                    workoutNames;
                                                exerciceNumsInput = nExercices;
                                              });
                                            }
                                          },
                                          child: Text(
                                              "Continue to input exercices"),
                                        ),
                                      ],
                                    ));
                              }),
                            ),
                            //clicked ==3
                            Visibility(
                              visible: clicked == 3,
                              child: Center(
                                child: StatefulBuilder(
                                  // onInitState:(),
                                  builder: (context, state) {
                                    final formKey = GlobalKey<FormState>();
                                    List<List<String?>> wNames =
                                        workoutNamesInput;
                                    List<List<String?>> eNums =
                                        exerciceNumsInput;

                                    int counter = currCounter;
                                    print("Counter: ");

                                    List<List<List<String?>>> fullExerciceList =
                                        List.generate(
                                            wNames.length,
                                            (i) => List.generate(
                                                wNames[i].length, (j) => []));

                                    if (counter == 0) {
                                      exerciceInputs = fullExerciceList;
                                      setsInput = fullExerciceList;
                                    }
                                    print("program data: ${exerciceInputs}");
                                    print("exercice list: ${setsInput}");

                                    print(
                                        "Session counter type ${counter.runtimeType}");
                                    print("Session counter ${counter}");
                                    void nextForm() {
                                      super.setState(
                                        () {
                                          if (currCounter == null) {
                                            return;
                                          } else {
                                            currCounter = currCounter + 1;
                                            print(
                                                "counter after: ${currCounter}");
                                          }
                                          // counter++;
                                        },
                                      );
                                    }

                                    return Container(
                                      // color: Colors.blueAccent,
                                      child: Form(
                                          key: formKey,
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            alignment: WrapAlignment.center,
                                            children: [
                                              ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxHeight: 500,
                                                  minHeight: 400,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${sessionNameInput[counter]} Session",
                                                      style: const TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Expanded(
                                                      child: ListView.builder(
                                                          itemCount:
                                                              wNames[counter]
                                                                  .length,
                                                          itemBuilder: (context,
                                                              workoutIndex) {
                                                            return Column(
                                                              children: [
                                                                Center(
                                                                  child: (Text(
                                                                      "Workout: ${wNames[counter][workoutIndex]}")),
                                                                ),
                                                                Center(
                                                                    child:
                                                                        ConstrainedBox(
                                                                  constraints: const BoxConstraints(
                                                                      maxHeight:
                                                                          250,
                                                                      maxWidth:
                                                                          250),
                                                                  child: ListView
                                                                      .builder(
                                                                          itemCount: int.parse(eNums[counter]
                                                                              [
                                                                              workoutIndex]!),
                                                                          itemBuilder:
                                                                              (context, exerciceIndex) {
                                                                            return SizedBox(
                                                                                child: Wrap(alignment: WrapAlignment.center, direction: Axis.horizontal, children: [
                                                                              SizedBox(
                                                                                width: 75,
                                                                                child: TextFormField(
                                                                                  onSaved: (newValue) {
                                                                                    setState(
                                                                                      () {
                                                                                        exerciceInputs[counter][workoutIndex].add(newValue);
                                                                                        // print("sm: $sm");
                                                                                        // [[],[],[]]
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  validator: (value) {
                                                                                    if (value == null || value.isEmpty) {
                                                                                      return 'Please enter some text';
                                                                                    }
                                                                                    return null;
                                                                                  },
                                                                                  // controller: ,
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(fontSize: 10),
                                                                                  decoration: InputDecoration(
                                                                                    label: Text("Enter Exercice Name"),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 75,
                                                                                child: TextFormField(
                                                                                  onSaved: (newValue) {
                                                                                    // setsInput[counter][workoutIndex].add(newValue);
                                                                                  },
                                                                                  // controller: ,
                                                                                  validator: (value) {
                                                                                    if (value == null || value.isEmpty) {
                                                                                      return 'Please enter some text';
                                                                                    }
                                                                                    return null;
                                                                                  },
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(fontSize: 10),
                                                                                  decoration: InputDecoration(
                                                                                    label: Text("Enter Sets"),
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ]));
                                                                          }),
                                                                ))
                                                              ],
                                                            );
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(
                                                      () {
                                                        clicked = clicked - 1;
                                                      },
                                                    );
                                                  },
                                                  child:
                                                      Icon(Icons.arrow_back)),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    if (formKey.currentState!
                                                        .validate()) {
                                                      formKey.currentState!
                                                          .save();
                                                      setState(() {
                                                        print(
                                                            "exerciceInputs before: ${exerciceInputs}");
                                                        print(
                                                            "exerciceInputs after: ${exerciceInputs}");

                                                        clicked = 3;
                                                        print(
                                                            "\n clicked: ${clicked}");
                                                        print(
                                                            "counter before state update ${counter}");
                                                      });
                                                      if (counter <
                                                          sessionNameInput
                                                                  .length -
                                                              1) {
                                                        nextForm();
                                                      } else {
                                                        clicked = 4;
                                                        // Navigator.pop(context);
                                                        print(
                                                            "\n clicked: ${clicked}");
                                                        var buildProgram =
                                                            List.generate(
                                                                wNames.length,
                                                                (sessionIndex) => Session
                                                                    .noId(
                                                                        name: sessionNameInput[
                                                                            sessionIndex]!,
                                                                        workouts: List.generate(
                                                                            wNames[sessionIndex].length,
                                                                            (workoutIndex) {
                                                                          // var sessionWorkouts =
                                                                          // Workout(exercise: [List.], name: '');
                                                                          // wNames[sessionIndex];
                                                                          String
                                                                              wName =
                                                                              workoutNamesInput[sessionIndex][workoutIndex]!;
                                                                          print(
                                                                              "Current workout name: ${wName}");
                                                                          return Workout(
                                                                              name: wName,
                                                                              exercise: List.generate(int.parse(eNums[sessionIndex][workoutIndex]!), (index) {
                                                                                // print("Current");
                                                                                return Exercice(name: exerciceInputs[sessionIndex][workoutIndex][index], sets: setsInput[sessionIndex][workoutIndex][index]);
                                                                              }));
                                                                        })));
                                                        // programData =
                                                        //     buildProgram;
                                                        programSession =
                                                            buildProgram;
                                                        // programData
                                                      }
                                                    }
                                                  },
                                                  child: Text("Build Program"))
                                            ],
                                          )),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Visibility(
                              visible: clicked == 4,
                              child: Builder(builder: (context) {
                                var weekCounter = 0;
                                var incr = 1;
                                var seshCtr = -1;
                                programData = ProgramClass(
                                    programName: "MadCow",
                                    sessions: programSession,
                                    duration: int.parse(programDuration),
                                    frequency: int.parse(programFreq));

                                programData.buildProgram();
                                for (var e in programData.programSessions[0]!) {
                                  print(
                                      "Week: ${weekCounter + 1}, Session:${e!.name}");
                                  for (int i = 0; i < e.workouts.length; i++) {
                                    print(
                                        "workout length: ${e.workouts.length}");
                                    print(
                                        "exercice length: ${e.workouts[i].exercise.length}");
                                    print("workout: ${e.workouts[i].name}");
                                    for (int j = 0;
                                        j < e.workouts[i].exercise.length;
                                        j++) {
                                      print(
                                          "Exercices: ${e.workouts[i].exercise[j].name}");
                                    }
                                  }
                                  print("\n");
                                  if (((incr % programData.frequency) == 0) &&
                                      (incr != 0)) {
                                    weekCounter++;
                                  }
                                  incr++;
                                }
                                return Container(
                                  color: Colors.grey,
                                  child: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxHeight: 500,
                                        minHeight: 400,
                                      ),
                                      child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 20,
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 20),
                                        itemCount: programData
                                            .duration, //3 sessions each week, 4 weeks
                                        itemBuilder: (context, index) {
                                          return Container(
                                            color: Colors.brown,
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                maxHeight: double.maxFinite,
                                                maxWidth: double.maxFinite,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text("Week: ${index + 1}"),
                                                  Container(
                                                    color: Colors.amber,
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxHeight: 150,
                                                        maxWidth: 200,
                                                      ),
                                                      child: ListView.builder(
                                                          // physics:
                                                          //     NeverScrollableScrollPhysics(),
                                                          itemCount: programData
                                                              .frequency, //each allocated session based on frequency, eg 3 freq 3 sessions per week
                                                          itemBuilder: (context,
                                                              weekIndex) {
                                                            print(
                                                                "Session: ${seshCtr}");
                                                            seshCtr++;
                                                            return Container(
                                                              // color:
                                                              // Colors.amber,
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                      "Session: ${programData.programSessions[0]![seshCtr]!.name}"),
                                                                  ConstrainedBox(
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        maxHeight:
                                                                            60,
                                                                        maxWidth:
                                                                            150,
                                                                      ),
                                                                      child: ListView.builder(
                                                                          physics: NeverScrollableScrollPhysics(),
                                                                          itemCount: programData.programSessions[0]![seshCtr]!.workouts.length,
                                                                          itemBuilder: (context, workoutIndex) {
                                                                            print("length ${programData.programSessions[0]![seshCtr]!.workouts.length}");
                                                                            return Column(
                                                                              children: [
                                                                                ConstrainedBox(
                                                                                  constraints: const BoxConstraints(
                                                                                    maxHeight: 40,
                                                                                    maxWidth: 140,
                                                                                  ),
                                                                                  child: ListView.builder(
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: programData.programSessions[0]![seshCtr]!.workouts[workoutIndex].exercise.length,
                                                                                      itemBuilder: (context, index) {
                                                                                        return (Text("Exercice ${index + 1}: ${programData.programSessions[0]![seshCtr]!.workouts[workoutIndex].exercise[index].name}"));
                                                                                      }),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          })),
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<String?> navStack = [];
    var navigatorState = Navigator.of(context);
    for (var object in navigatorState.widget.pages) {
      navStack.add(object.name);
    }

    print("ProgramBuilder Page Nav stack : ${navStack}");
    print("Test at start of build: ${_test}");

    // @override

    return WillPopScope(
      child: Consumer<ProgramsList>(
        builder: (context, value, child) {
          if (value.programs.length == 0) {
            print(value.programs.length);
            return Scaffold(
              resizeToAvoidBottomInset: true,
              // backgroundColor: Colors.amber,
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text('Program Builder')),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  // Center(child: Text("Welcome to program builder")),
                  Center(
                    child: Text(
                      "Please Add a program. Click the plus button to get started.",
                      // textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // print(context.settingd)
                  // context.pop();
                  createProgram();
                },
                child: const Icon(Icons.add),
              ),
              bottomNavigationBar: const BottomNav(2),
            );
          } else {
            print("${value.programs[0]![0].duration}");
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Program Builder(display)"),
              ),
              body: ListView.builder(
                  itemCount: value.programs.length,
                  itemBuilder: (context, index) {
                    print("index: ${index}");
                    print(
                        "index: ${index} duration :${value.programs[index]![index].duration}");
                    return ProgramsInfo(programClass: value.programs[index]);
                  }),
              bottomNavigationBar: const BottomNav(2),
            );
          }
        },
      ),
      onWillPop: () async => false,
    );
  }
}
