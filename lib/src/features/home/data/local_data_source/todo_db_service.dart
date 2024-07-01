import 'package:hive/hive.dart';
import 'package:todo_app/src/core/resources/common.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/error_strings.dart';
import 'package:todo_app/src/core/web_services/api_result.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';

class ToDoDBService {
  ///box key
  static const String _key = AppConstants.kTasksBox;

  final _tasksBox = Hive.box<TaskModel>(_key);

  Future<List<TaskModel>?> getAllToDos() async {
    try {
      if (_tasksBox.isOpen && _tasksBox.isNotEmpty) {
        return _tasksBox.values.toList();
      } else {
        return null;
      }
    } catch (e) {
      // Handle read errors
      logger.e('${ErrorStrings.kReadError} $e');
    }

    return null;
  }

  Future<void> addAllToDos({required List<TaskModel> list}) async {
    try {
      await _tasksBox.addAll(list);
    } catch (e) {
      // Handle insertion errors
      logger.e('${ErrorStrings.kInsertError} $e');
    }
  }

  Future<ApiResult> addToDos({required TaskModel task}) async {
    try {
      var response = await _tasksBox.add(task);
      return ApiResult.success(response);
    } catch (e) {
      // Handle insertion errors
      logger.e('${ErrorStrings.kInsertError} $e');
      return ApiResult.error('${ErrorStrings.kInsertError} $e');
    }
  }

  Future<void> deleteToDo({required int id}) async {
    try {
      await _tasksBox.delete(id);
    } catch (e) {
      // Handle deletion errors
      logger.e('${ErrorStrings.kDeleteError} $e');
    }
  }

  Future<void> updateToDo({required TaskModel task}) async {
    try {
      return await task.save();
    } catch (e) {
      // Handle deletion errors
      logger.e('${ErrorStrings.kUpdateError} $e');
    }
  }

  Future<dynamic> clearAllToDos() async {
    try {
      return await _tasksBox.clear();
    } catch (e) {
      // Handle deletion errors
      logger.e('${ErrorStrings.kDeleteError} $e');
    }
  }

  Future<bool> isDataAvailable() async {
    try {
      return _tasksBox.isEmpty;
    } catch (e) {
      // Handle error checking box emptiness
      logger.e('${ErrorStrings.kEmptyBox} $e');
      return true; // Return true assuming it's empty on error
    }
  }
}
