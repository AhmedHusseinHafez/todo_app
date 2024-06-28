import 'package:flutter/material.dart';
import 'package:todo_app/core/resources/injection.dart';
import 'package:todo_app/core/resources/strings_manager.dart';
import 'package:todo_app/core/web_services/connection_helper.dart';
import 'package:todo_app/features/home/presentation/home.dart';

class Routes {
  static const String navigationViewRoute = '/navigationViewRoute';
}

class RouteGenerator {
  static late InternetConnectionHelper connectivity;


  RouteGenerator() {
    connectivity = getIt<InternetConnectionHelper>();

  }

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.navigationViewRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
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
