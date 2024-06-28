import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/theme_manager.dart';
import 'package:todo_app/generated/l10n.dart';
import '../core/resources/route_manager.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // MyApp({super.key});
  MyApp._internal();

  static final MyApp _instance = MyApp._internal(); // single instance

  factory MyApp() => _instance; // factory to get single instance

  final RouteGenerator routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, state) {
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
  }
}
