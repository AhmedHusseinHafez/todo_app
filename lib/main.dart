import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/app/app.dart';
import 'package:todo_app/src/core/resources/bloc_observer.dart';
import 'package:todo_app/src/core/resources/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future.wait([
    initGetIt(),
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ])
  ]).then((_) {
    Bloc.observer = AppObserver();

    runApp(MyApp());
  });
}
