part of 'update_todo_cubit.dart';

@freezed
class UpdateToDoState with _$UpdateToDoState {
  const factory UpdateToDoState.initial() = _Initial;
  const factory UpdateToDoState.loading() = _Loading;

  const factory UpdateToDoState.success(ToDoModel model) = _Success;
  const factory UpdateToDoState.failure(String error) = _Failure;
}
