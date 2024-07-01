import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';

part 'update_todo_state.dart';
part 'update_todo_cubit.freezed.dart';

class UpdateToDoCubit extends Cubit<UpdateToDoState> {
  UpdateToDoCubit(this._toDoRepository)
      : super(const UpdateToDoState.initial());

  final ToDoRepository _toDoRepository;

  void updateTask(
      {required ToDoModel newModel, required ToDoModel oldModel}) async {
    emit(const UpdateToDoState.loading());
    try {
      oldModel.title = newModel.title;
      oldModel.description = newModel.description;
      oldModel.status = newModel.status;
      oldModel.isSynced = newModel.isSynced;
      oldModel.updatedAt = newModel.updatedAt;

      await _toDoRepository.upDateToDo(toDo: oldModel);

      emit(UpdateToDoState.success(oldModel));
    } catch (e) {
      emit(UpdateToDoState.failure(e.toString()));
    }
  }
}
