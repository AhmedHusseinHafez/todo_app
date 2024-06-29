import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';

part 'tasks_logic_state.dart';
part 'tasks_logic_cubit.freezed.dart';

class TasksLogicCubit extends Cubit<TasksLogicState> {
  TasksLogicCubit() : super(const TasksLogicState.initial());

  void addTask(TaskModel task) async {
    emit(const TasksLogicState.createTaskLoading());
    try {
      var taskBox = Hive.box<TaskModel>(AppConstants.kTasksBox);
      await taskBox.add(task);
      emit(TasksLogicState.createTaskSuccess(task: task));
    } catch (e) {
      emit(TasksLogicState.createTaskError(error: e.toString()));
    }
  }

  void getTasks() {
    // you don't need [emit loading] here with [hive] because [taskBox.values] not [Future]
    emit(const TasksLogicState.getTasksLoading());
    try {
      var taskBox = Hive.box<TaskModel>(AppConstants.kTasksBox);
      emit(TasksLogicState.getTasksSuccess(tasks: taskBox.values.toList()));
    } catch (e) {
      emit(TasksLogicState.getTasksError(error: e.toString()));
    }
  }
  // void updateTask(TaskModel task) async {
  //   emit(const TasksLogicState.updateTaskLoading());
  //   try {
  //     var taskBox = Hive.box<TaskModel>(AppConstants.kTasksBox);
  //     await taskBox.put(task.id, task);
  //     emit(TasksLogicState.updateTaskSuccess(task: task));
  //   } catch (e) {
  //     emit(TasksLogicState.updateTaskError(error: e.toString()));
  //   }
  // }

  // void deleteTask(int id) async {
  //   emit(const TasksLogicState.deleteTaskLoading());
  //   try {
  //     var taskBox = Hive.box<TaskModel>(AppConstants.kTasksBox);
  //     await taskBox.delete(id);
  //     emit(TasksLogicState.deleteTaskSuccess(id: id));
  //   } catch (e) {
  //     emit(TasksLogicState.deleteTaskError(error: e.toString()));
  //   }
  // }
}
