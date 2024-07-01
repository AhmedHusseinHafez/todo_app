import 'package:todo_app/src/core/resources/common.dart';
import 'package:todo_app/src/core/resources/error_strings.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Initialize [Hive] for the app and [openBox] for [ToDoModel] and then [registerAdapter] this model.
Future hiveInit() async {
  try {
    await Hive.initFlutter();
    // Make sure that you [registerAdapter] before [openBox]
    Hive.registerAdapter(ToDoModelAdapter());
    await Hive.openBox<ToDoModel>(AppConstants.kToDoBox);

    logger.d('Success on initializing database For *ToDoModel*');
  } catch (error) {
    logger.e('${ErrorStrings.kInitError} $error');
  }
}
