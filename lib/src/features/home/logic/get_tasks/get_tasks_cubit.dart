import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';

part 'get_tasks_state.dart';
part 'get_tasks_cubit.freezed.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  ToDoRepository toDoRepository;
  GetTasksCubit(this.toDoRepository) : super(const GetTasksState.initial());

  void getTasks() async {
    emit(const GetTasksState.getTasksLoading());
    var result = await toDoRepository.fetchToDos();
    result.when(success: (data) {
      emit(GetTasksState.getTasksSuccess(tasks: data ?? []));
    }, failure: (error) {
      emit(GetTasksState.getTasksError(error: error.toString()));
    }, error: (error) {
      emit(GetTasksState.getTasksError(error: error.toString()));
    });
  }
}
