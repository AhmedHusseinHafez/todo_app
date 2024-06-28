import 'package:flutter/material.dart';
import 'package:todo_app/src/core/resources/injection.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/web_services/connection_helper.dart';
import 'package:todo_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:todo_app/src/features/home/presentation/screens/task_screen.dart';

class Routes {
  static const String homePage = '/';
  static const String taskScreen = '/taskScreen';
}

class RouteGenerator {
  static late InternetConnectionHelper connectivity;

  RouteGenerator() {
    connectivity = getIt<InternetConnectionHelper>();
  }

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );

      case Routes.taskScreen:
        var args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => TaskScreen(
            model: args["model"],
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
              body: Center(
            child: Text('${StringsManager.noRouteFound} ${settings.name}'),
          )),
        );
    }
  }
}
