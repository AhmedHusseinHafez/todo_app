import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';

part 'add_todo_state.dart';
part 'add_todo_cubit.freezed.dart';

class AddToDoCubit extends Cubit<AddToDoState> {
  AddToDoCubit(this._toDoRepository) : super(const AddToDoState.initial());

  final ToDoRepository _toDoRepository;

  void addToDo(ToDoModel toDo) async {
    emit(const AddToDoState.createToDoLoading());
    var result = await _toDoRepository.addToDo(toDo: toDo);

    result.when(
      success: (_) {
        emit(AddToDoState.createToDoSuccess(todo: toDo));
      },
      failure: (_) {},
      error: (error) {
        emit(AddToDoState.createToDoError(error: error.toString()));
      },
    );
  }
}
