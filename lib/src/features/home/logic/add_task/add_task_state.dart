part of 'add_task_cubit.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState.initial() = _Initial;
  const factory AddTaskState.createTaskLoading() = _CreateTaskLoading;
  const factory AddTaskState.createTaskSuccess({required TaskModel task}) =
      _CreateTaskSuccess;
  const factory AddTaskState.createTaskError({required String error}) =
      _CreateTaskError;
}
