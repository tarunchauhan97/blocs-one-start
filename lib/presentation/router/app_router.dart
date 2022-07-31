import 'package:blocs_one/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import 'package:blocs_one/presentation/screens/home_screen.dart';
import 'package:blocs_one/presentation/screens/second_screen.dart';
import 'package:blocs_one/presentation/screens/third_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: "Second Screen",
            color: Colors.redAccent,
            homeScreenKey: key,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: "Thirst Screen",
            color: Colors.greenAccent,
          ),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );
      default:
        return null;
    }
  }
}
