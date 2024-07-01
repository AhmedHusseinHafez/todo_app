part of 'add_todo_cubit.dart';

@freezed
class AddToDoState with _$AddToDoState {
  const factory AddToDoState.initial() = _Initial;
  const factory AddToDoState.createToDoLoading() = _CreateToDoLoading;
  const factory AddToDoState.createToDoSuccess({required ToDoModel todo}) =
      _CreateToDoSuccess;
  const factory AddToDoState.createToDoError({required String error}) =
      _CreateToDoError;
}
