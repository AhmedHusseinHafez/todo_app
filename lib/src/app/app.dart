import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/injection.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/theme_manager.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/src/core/web_services/connection_helper.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';
import '../core/resources/route_manager.dart';

final navigatorKey = GlobalKey<NavigatorState>();

ConnectivityResult? kInternetConnection;

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal(); // single instance

  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final RouteGenerator routeGenerator = RouteGenerator();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      kInternetConnection =
          await InternetConnectionHelper.checkInternetConnection();
      if (kInternetConnection != null) {
        // getIt<ToDoRepository>().syncWithServer();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, state) {
        return StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              kInternetConnection = snapshot.data;
              // getIt<ToDoRepository>().syncWithServer();
            }
            return MaterialApp(
              title: StringsManager.appTitle,
              navigatorKey: navigatorKey,
              locale: const Locale('en'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: routeGenerator.getRoute,
              theme: AppTheme.kLightTheme,
              initialRoute: Routes.homePage,
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
