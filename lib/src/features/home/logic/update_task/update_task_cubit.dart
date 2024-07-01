import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';

part 'update_task_state.dart';
part 'update_task_cubit.freezed.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this._toDoRepository)
      : super(const UpdateTaskState.initial());

  final ToDoRepository _toDoRepository;

  void updateTask(
      {required TaskModel newModel, required TaskModel oldModel}) async {
    emit(const UpdateTaskState.loading());
    try {
      oldModel.title = newModel.title;
      oldModel.description = newModel.description;
      oldModel.status = newModel.status;
      oldModel.isSynced = newModel.isSynced;
      oldModel.updatedAt = newModel.updatedAt;

      await _toDoRepository.upDateToDo(task: oldModel);

      emit(UpdateTaskState.success(oldModel));
    } catch (e) {
      emit(UpdateTaskState.failure(e.toString()));
    }
  }
}
