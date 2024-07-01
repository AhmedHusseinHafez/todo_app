import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_app/src/features/home/data/models/todo_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';

part 'get_todo_state.dart';
part 'get_todo_cubit.freezed.dart';

class GetToDoCubit extends Cubit<GetToDosState> {
  ToDoRepository toDoRepository;
  GetToDoCubit(this.toDoRepository) : super(const GetToDosState.initial());

  void getToDos() async {
    emit(const GetToDosState.getToDosLoading());
    var result = await toDoRepository.fetchToDos();
    result.when(success: (data) {
      emit(GetToDosState.getToDosSuccess(todos: data ?? []));
    }, failure: (error) {
      emit(GetToDosState.getToDosError(error: error.toString()));
    }, error: (error) {
      emit(GetToDosState.getToDosError(error: error.toString()));
    });
  }
}
