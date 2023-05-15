import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_tut/components/bottomNav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //navigation stack
    //show current route statck
    print("HomePage route: ${ModalRoute.of(context)?.settings.name}");
    List<String?> navStack = [];
    var navigatorState = Navigator.of(context);
    for (var object in navigatorState.widget.pages) {
      navStack.add(object.name);
    }

    print("Home Page Nav stack : ${navStack}");
    // var history =route.history;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar:
            AppBar(automaticallyImplyLeading: false, title: const Text('Home')),
        body: const Placeholder(),
        bottomNavigationBar: const BottomNav(0),
      ),
    );
  }
}
