import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider_tut/components/bottomNav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String?> navStack = [];
    var navigatorState = Navigator.of(context);
    for (var object in navigatorState.widget.pages) {
      navStack.add(object.name);
    }

    print("Profile Page Nav stack : ${navStack}");

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false, title: const Text('Profile')),
        body: const Placeholder(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // print(context.settingd)
            context.pop();
          },
          child: Text('Logout'),
        ),
        bottomNavigationBar: const BottomNav(3),
      ),
      onWillPop: () async => false,
    );
  }
}
