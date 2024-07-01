part of 'get_todo_cubit.dart';

@freezed
class GetToDosState with _$GetToDosState {
  const factory GetToDosState.initial() = _Initial;
  const factory GetToDosState.getToDosLoading() = _GetToDosLoading;
  const factory GetToDosState.getToDosSuccess(
      {required List<ToDoModel> todos}) = _GetToDosSuccess;
  const factory GetToDosState.getToDosError({required String error}) =
      _GetToDosError;
}
