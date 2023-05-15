import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final int navIndex;
  const BottomNav(this.navIndex);
  @override
  Widget build(BuildContext context) {
    print("nav index: ${navIndex}");
    return BottomNavigationBar(
      iconSize: 20,
      currentIndex: navIndex,
      onTap: (tab) {
        switch (tab) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/session');
            break;
          case 2:
            context.go('/probuilder');
            break;
          case 3:
            context.go('/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note),
          label: 'Session',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Program',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Profile',
          backgroundColor: Colors.blue,
        ),
      ],
    );
  }
}
