part of 'get_tasks_cubit.dart';

@freezed
class GetTasksState with _$GetTasksState {
  const factory GetTasksState.initial() = _Initial;
  const factory GetTasksState.getTasksLoading() = _GetTasksLoading;
  const factory GetTasksState.getTasksSuccess(
      {required List<TaskModel> tasks}) = _GetTasksSuccess;
  const factory GetTasksState.getTasksError({required String error}) =
      _GetTasksError;
}
