import 'package:todo_app/src/core/web_services/web_services.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';

class ToDoApiHandler {
  final WebServices _webServices;

  ToDoApiHandler(this._webServices);

  Future<List<TaskModel>?> getToDos() async {
    return await _webServices.getToDos();
  }

  Future<TaskModel?> deleteToDo(String id) async {
    return await _webServices.deleteToDo(id);
  }

  Future<TaskModel?> addToDo(TaskModel task) async {
    return await _webServices.addToDo(task);
  }

  Future<TaskModel?> updateToDo(String id, TaskModel taskModel) async {
    return await _webServices.updateToDo(id, taskModel.toJson());
  }
}
