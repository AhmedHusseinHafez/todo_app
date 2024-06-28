import 'package:todo_app/src/features/home/data/models/task_model.dart';

class AppConstants {
  static const String domain = '';
}

List<TaskModel> tempTasks = [
  TaskModel(
    id: "1",
    title: 'Task 1',
    description: 'Description 1',
    status: "In Progress",
    isDone: false,
    createdAt: "2022-01-01",
    updatedAt: "2022-01-02",
  ),
  TaskModel(
    id: "2",
    title: 'Task 2',
    description: 'Description 2',
    status: "Done",
    isDone: true,
    createdAt: "2022-01-01",
    updatedAt: null,
  ),
  TaskModel(
    id: "3",
    title: 'Task 3',
    description: 'Description 3',
    status: "In Progress",
    isDone: false,
    createdAt: "2022-01-01",
    updatedAt: "2022-01-02",
  ),
  TaskModel(
    id: "4",
    title: 'Task 4',
    description: 'Description 4',
    status: "Done",
    isDone: true,
    createdAt: "2022-01-01",
    updatedAt: null,
  ),
];
