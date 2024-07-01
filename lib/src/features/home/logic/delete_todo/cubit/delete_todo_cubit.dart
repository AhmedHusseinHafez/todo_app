import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';

part 'delete_todo_state.dart';
part 'delete_todo_cubit.freezed.dart';

class DeleteTodoCubit extends Cubit<DeleteTodoState> {
  DeleteTodoCubit(this._toDoRepository)
      : super(const DeleteTodoState.initial());

  final ToDoRepository _toDoRepository;

  Future<void> deleteTodo({required String id}) async {
    emit(const DeleteTodoState.loading());
    try {
      await _toDoRepository.markAsDeleted(id: id);
      emit(const DeleteTodoState.success());
    } catch (error) {
      emit(DeleteTodoState.failure(error: error.toString()));
    }
  }
}
