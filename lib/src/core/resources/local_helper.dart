import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Initialize [Hive] for the app and [openBox] for [TaskModel] and then [registerAdapter] this model.
Future hiveInit() async {
  await Hive.initFlutter();
  // Make sure that you [registerAdapter] before [openBox]
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(AppConstants.kTasksBox);
}
