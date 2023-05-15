import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider_tut/classes/session_class.dart';
import 'package:provider_tut/classes/workout_class.dart';
import 'package:provider_tut/data/programs_list.dart';
import 'package:provider_tut/data/workout_sessions.dart';
import 'package:provider_tut/pages/program_builder_page.dart';
// import 'package:provider_tut/pages/workout_page.dart';
import 'pages/export_pages.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  observers: [
    // NavigatorObserver observer = NavigatorObserver(),
    // NavigatorObserver(),
  ],
  routes: <GoRoute>[
    GoRoute(
      name: MyAppRouteConstants.loginRouteName,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: [
        GoRoute(
          name: MyAppRouteConstants.homeRouteName,
          path: 'home',
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
            // name: MyAppRouteConstants.homeRouteName,
            path: 'session',
            builder: (context, state) {
              return const SessionPage();
            },
            routes: [
              GoRoute(
                  name: "workout",
                  path: 'workout',
                  builder: (context, state) {
                    // print('from workout page' +
                    //     GoRouterState.of(context).location);
                    final Session? session = state.extra as Session?;
                    return WorkoutPage(
                      session: session!,
                    );
                  },
                  routes: [
                    GoRoute(
                        name: 'exercise',
                        path: 'exercise',
                        builder: (context, state) {
                          final Workout? workout = state.extra as Workout?;
                          return ExercisePage(
                            workout: workout!,
                          );
                        }),
                  ])
            ]),
        GoRoute(
          // name: "probuilder",
          path: 'probuilder',
          builder: (context, state) {
            return const ProgramBuilderPage();
          },
        ),
        GoRoute(
          name: "profile",
          path: 'profile',
          builder: (context, state) {
            return const ProfilePage();
          },
        )
      ],
    ),
  ],
);

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WorkoutSessions(),
          child: const SessionPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProgramsList(),
          child: const ProgramBuilderPage(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        // routeInformationProvider: router.routeInformationProvider,
        // routeInformationParser: router.routeInformationParser,
        // routerDelegate: router.routerDelegate,

        title: "Go router",
        // home: Scaffold(
        //   a  ppBar: AppBar(
        //     title: const Text(
        //       'Page2',
        //     ),
        //   ),
        //   body: const LoginPage(),
        // ),
      ),
    );
  }
}

class MyAppRouteConstants {
  static const String loginRouteName = "login";
  static const String homeRouteName = "home";
}
