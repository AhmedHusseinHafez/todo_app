import 'package:todo_app/src/core/web_services/web_services.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';

class ToDoApiHandler {
  final WebServices _webServices;

  ToDoApiHandler(this._webServices);

  Future<List<ToDoModel>?> getToDos() async {
    return await _webServices.getToDos();
  }

  Future<ToDoModel?> deleteToDo(String id) async {
    return await _webServices.deleteToDo(id);
  }

  Future<ToDoModel?> addToDo(ToDoModel todo) async {
    return await _webServices.addToDo(todo);
  }

  Future<ToDoModel?> updateToDo(String id, ToDoModel toDoModel) async {
    return await _webServices.updateToDo(id, toDoModel.toJson());
  }
}
