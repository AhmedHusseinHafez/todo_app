import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/core/resources/injection.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/web_services/connection_helper.dart';
import 'package:todo_app/src/features/home/logic/get_todo/get_todo_cubit.dart';
import 'package:todo_app/src/features/home/presentation/screens/home_screen.dart';
import 'package:todo_app/src/features/home/presentation/screens/todo_screen.dart';
import 'package:todo_app/src/features/home/presentation/screens/trash_screen.dart';

class Routes {
  static const String homePage = '/';
  static const String todoScreen = '/todoScreen';
  static const String trashScreen = '/trashScreen';
}

class RouteGenerator {
  static late InternetConnectionHelper connectivity;
  static late GetToDoCubit getToDoCubit;

  RouteGenerator() {
    connectivity = getIt<InternetConnectionHelper>();
    getToDoCubit = getIt<GetToDoCubit>();
  }

  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getToDoCubit,
            child: const HomePage(),
          ),
        );

      case Routes.todoScreen:
        var args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => ToDoScreen(
            model: args["model"],
          ),
        );

      case Routes.trashScreen:
        var args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => TrashScreen(
            deletedToDos: args["deletedToDos"],
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
