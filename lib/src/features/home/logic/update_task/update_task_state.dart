part of 'update_task_cubit.dart';

@freezed
class UpdateTaskState with _$UpdateTaskState {
  const factory UpdateTaskState.initial() = _Initial;
  const factory UpdateTaskState.loading() = _Loading;

  const factory UpdateTaskState.success(TaskModel model) = _Success;
  const factory UpdateTaskState.failure(String error) = _Failure;
}
