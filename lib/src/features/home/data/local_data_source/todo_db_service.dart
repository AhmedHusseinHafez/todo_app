import 'package:hive/hive.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';

/// A service class for managing ToDos in the local database using Hive.
class ToDoDBService {
  /// The key used to identify the ToDo Hive box.
  static const String _key = AppConstants.kToDoBox;

  final _toDoBox = Hive.box<ToDoModel>(_key);

  /// Retrieves all ToDos from the local database.
  ///
  /// Returns a list of [ToDoModel] if the box is open and not empty,
  /// otherwise returns null.
  Future<List<ToDoModel>?> getAllToDos() async {
    if (_toDoBox.isOpen && _toDoBox.isNotEmpty) {
      return _toDoBox.values.toList();
    }
    return null;
  }

  /// Adds a new ToDo to the local database.
  ///
  /// [toDo] is required to be added to the ToDo box.
  ///
  /// Returns the index of the newly added ToDo.
  Future<int> addToDos({required ToDoModel toDo}) async {
    return await _toDoBox.add(toDo);
  }

  /// Updates an existing ToDo in the local database.
  ///
  /// [toDo] is required to be updated.
  Future<void> updateToDo({required ToDoModel toDo}) async {
    await toDo.save();
  }

  /// Finds a ToDo by its ID.
  ///
  /// [id] is required as the identifier of the ToDo to be found.
  ///
  /// Returns the [ToDoModel] if found, otherwise returns null.
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

  /// Marks a ToDo as deleted in the local database.
  ///
  /// [id] is required as the identifier of the ToDo to be marked as deleted.
  ///
  /// Returns the updated [ToDoModel] if found and marked as deleted,
  /// otherwise returns null.
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
