// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/classes/session_class.dart';
import 'package:provider_tut/components/bottomNav.dart';
import 'package:provider_tut/data/workout_sessions.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final sessionId = 0;
  TextEditingController addSessionController = TextEditingController();

  // void addSession(WorkoutSessions sessions) {
  //   sessions.addSesssion(addSessionController.text, sessionId);
  // }
  void save() {
    String sessionName = addSessionController.text;
    // print(sessionName);
    if (sessionName == '') {
      Navigator.pop(context);
    } else {
      Session session = Session(
        name: sessionName,
        workouts: [],
        sessionId: sessionId,
      );
      Provider.of<WorkoutSessions>(context, listen: false).addSession(session);

      // print("Dialogue navigator: " + Navigator.defaultRouteName);
      addSessionController.clear();
      Navigator.pop(context);
    }

    // print("Dialogue navigator: " + Navigator.defaultRouteName);
  }

  void cancel() {
    // if (addSessionController.text)
    List<String?> navStack = [];
    var navigatorState = Navigator.of(context);
    for (var object in navigatorState.widget.pages) {
      navStack.add(object.name);
    }

    Navigator.pop(context);
  }

  void createSession() {
    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text('Create New Session'),
            content: TextField(
              controller: addSessionController,
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
          ),
        );
      },
    );
  }

  void enterSession(String name, int id) {
    Session? session = Provider.of<WorkoutSessions>(context, listen: false)
        .getSession(name, id);

    context.push('/session/workout/', extra: session);
  }

  @override
  Widget build(BuildContext context) {
    List<String?> navStack = [];
    var navigatorState = Navigator.of(context);
    for (var object in navigatorState.widget.pages) {
      navStack.add(object.name);
    }

    print("Session Page Nav stack : ${navStack}");

    return WillPopScope(
      child: Consumer<WorkoutSessions>(
        builder: (context, value, child) {
          if (value.sessions.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Session View"),
              ),
              bottomNavigationBar: const BottomNav(1),
              body: const Center(
                child: Text('Session Empty, Add New Session Below'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: createSession,
                child: const Icon(Icons.add),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('Session View'),
              ),
              body: ListView.builder(
                  itemCount: value.sessions[sessionId]?.length,
                  itemBuilder: ((context, index) {
                    // print(value.sessions[sessionId]?.length);
                    Session? session = value.sessions[sessionId]?[index];
                    String? name = session?.name;
                    return ListTile(
                      title: Text("${name!}"),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () => enterSession(name, sessionId),
                        //  () {
                        //   // String? name = value.sessions[sessionId]?[index].name;
                        //   // context.push('/session/workout/', extra: name);
                        // },
                      ),
                    );
                  })),
              bottomNavigationBar: const BottomNav(1),
              floatingActionButton: FloatingActionButton(
                onPressed: createSession,
                child: const Icon(Icons.add),
              ),
            );
          }
        },
      ),
      onWillPop: () async => false,
    );
  }
}
