import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';

part 'add_task_state.dart';
part 'add_task_cubit.freezed.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._toDoRepository) : super(const AddTaskState.initial());

  final ToDoRepository _toDoRepository;

  void addTask(TaskModel task) async {
    emit(const AddTaskState.createTaskLoading());
    var result = await _toDoRepository.addToDo(task: task);

    result.when(
      success: (_) {
        emit(AddTaskState.createTaskSuccess(task: task));
      },
      failure: (_) {},
      error: (error) {
        emit(AddTaskState.createTaskError(error: error.toString()));
      },
    );
  }
}
