import 'package:hive/hive.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';

class ToDoDBService {
  ///box key
  static const String _key = AppConstants.kToDoBox;

  final _toDoBox = Hive.box<ToDoModel>(_key);

  /// Get all ToDos from local database
  Future<List<ToDoModel>?> getAllToDos() async {
    if (_toDoBox.isOpen && _toDoBox.isNotEmpty) {
      return _toDoBox.values.toList();
    }
    return null;
  }

  /// Add ToDos to local database [ToDo Box]
  Future<int> addToDos({required ToDoModel toDo}) async {
    return await _toDoBox.add(toDo);
  }

  Future<void> updateToDo({required ToDoModel toDo}) async {
    await toDo.save();
  }

  Future<ToDoModel?> findById({required String id}) async {
    var data = await getAllToDos();

    if (data != null) {
      for (var toDo in data) {
        if (toDo.id == id) {
          return toDo;
        }
      }
    }
    return null;
  }

  Future<ToDoModel?> markAsDeleted({required String id}) async {
    var data = await findById(id: id);

    if (data != null) {
      data.isDeleted = true;
      data.isSynced = false;
      data.updatedAt = DateTime.now().toIso8601String();
      await data.save();
      return data;
    }
    return null;
  }
}
