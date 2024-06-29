part of 'tasks_logic_cubit.dart';

@freezed
class TasksLogicState with _$TasksLogicState {
  const factory TasksLogicState.initial() = _Initial;
  const factory TasksLogicState.createTaskLoading() = _CreateTaskLoading;
  const factory TasksLogicState.createTaskSuccess({required TaskModel task}) =
      _CreateTaskSuccess;
  const factory TasksLogicState.createTaskError({required String error}) =
      _CreateTaskError;

  const factory TasksLogicState.updateTaskLoading() = _UpdateTaskLoading;
  const factory TasksLogicState.updateTaskSuccess({required TaskModel task}) =
      _UpdateTaskSuccess;
  const factory TasksLogicState.updateTaskError({required String error}) =
      _UpdateTaskError;

  const factory TasksLogicState.deleteTaskLoading() = _DeleteTaskLoading;
  const factory TasksLogicState.deleteTaskSuccess({required int id}) =
      _DeleteTaskSuccess;
  const factory TasksLogicState.deleteTaskError({required String error}) =
      _DeleteTaskError;

  const factory TasksLogicState.getTasksLoading() = _GetTasksLoading;
  const factory TasksLogicState.getTasksSuccess(
      {required List<TaskModel> tasks}) = _GetTasksSuccess;
  const factory TasksLogicState.getTasksError({required String error}) =
      _GetTasksError;
}
