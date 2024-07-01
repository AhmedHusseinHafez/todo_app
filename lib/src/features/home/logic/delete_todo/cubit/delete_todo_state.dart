part of 'delete_todo_cubit.dart';

@freezed
class DeleteTodoState with _$DeleteTodoState {
  const factory DeleteTodoState.initial() = _Initial;
  const factory DeleteTodoState.loading() = _Loading;
  const factory DeleteTodoState.success() = _Success;
  const factory DeleteTodoState.failure({required String error}) = _Failure;
}
