import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/app/app.dart';
import 'package:todo_app/src/core/resources/common.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/error_strings.dart';
import 'package:todo_app/src/core/web_services/api_result.dart';
import 'package:todo_app/src/core/web_services/network_exceptions.dart';
import 'package:todo_app/src/features/home/data/local_data_source/todo_db_service.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/data/remote_data_source/remote_data_source.dart';

class ToDoRepository {
  ToDoRepository(
      {required ToDoApiHandler toDoApiHandler,
      required ToDoDBService dbService})
      : _toDoApiHandler = toDoApiHandler,
        _dbService = dbService;

  final ToDoApiHandler _toDoApiHandler;
  final ToDoDBService _dbService;

  static const String _key = AppConstants.kTasksBox;
  final _tasksBox = Hive.box<TaskModel>(_key);

  Future<ApiResult<List<TaskModel>?>> fetchToDos() async {
    if (kInternetConnection != ConnectivityResult.none &&
        kInternetConnection != null) {
      try {
        var remoteTasks = await _toDoApiHandler.getToDos();
        await mergeToDos(remoteTasks: remoteTasks ?? []);
        final cachedToDos = await _dbService.getAllToDos();
        return ApiResult.success(cachedToDos);
      } catch (_) {
        //failure(Unknown Error) - Connection is okay
        try {
          var result = await _dbService.getAllToDos();
          return ApiResult.success(result);
        } catch (error) {
          return ApiResult.error(error.toString());
        }
      }
    } else {
      //user internet connection is not safe - no internet connection
      try {
        var result = await _dbService.getAllToDos();
        return ApiResult.success(result);
      } catch (error) {
        return ApiResult.error(error.toString());
      }
    }
  }

  Future<ApiResult<dynamic>> addToDo({required TaskModel task}) async {
    return await _dbService.addToDos(task: task);
  }

  Future upDateToDo({required TaskModel task}) async {
    await _dbService.updateToDo(task: task);
  }

  Future<void> deleteAllToDos() async {
    await _dbService.clearAllToDos();
  }

  Future<void> mergeToDos({required List<TaskModel> remoteTasks}) async {
    try {
      List<TaskModel> localTasks = _tasksBox.values.toList();
      Map<String, TaskModel> mergedTasks = {};

      // Add local tasks to the map
      for (var task in localTasks) {
        mergedTasks[task.id] = task;
      }

      // Merge with remote tasks
      for (var remoteTask in remoteTasks) {
        if (mergedTasks.containsKey(remoteTask.id)) {
          // Conflict detected, decide how to resolve (by timestamp comparison)
          final localTask = mergedTasks[remoteTask.id]!;
          if (remoteTask.updatedAt != null &&
              localTask.updatedAt != null &&
              remoteTask.updatedAt!.compareTo(localTask.updatedAt!) > 0) {
            // Remote task is newer, overwrite local
            mergedTasks[remoteTask.id] = remoteTask;
          } else {
            // Local task is newer or they are the same
          }
        } else {
          // New remote task, add it to merged tasks
          mergedTasks[remoteTask.id] = remoteTask;
        }
      }

      // Save merged tasks back to the local storage
      await _tasksBox.clear();
      await _tasksBox.addAll(mergedTasks.values.toList());
    } catch (e) {
      logger.e('${ErrorStrings.kMergeError} $e');
    }
  }

  Future<ApiResult<TaskModel?>> syncWithServer() async {
    try {
      // Retrieve pending tasks from local storage
      var pendingTasks =
          _tasksBox.values.where((task) => task.isSynced == false).toList();

      var remoteTasks = await _toDoApiHandler.getToDos();

      // Send pending tasks to the server
      for (var task in pendingTasks) {
        if (remoteTasks != null &&
            remoteTasks.map((task) => task.id).contains(task.id)) {
          try {
            task.isSynced = true;
            task.save();
            var response = await _toDoApiHandler.updateToDo(task.id, task);
            return ApiResult.success(response);
          } catch (error, stackTrace) {
            task.isSynced = false;
            task.save();
            return ApiResult.failure(
                DioExceptionTypes.getDioException(error, stackTrace));
          }
        } else {
          try {
            task.isSynced = true;
            task.save();
            var response = await _toDoApiHandler.addToDo(task);
            return ApiResult.success(response);
          } catch (error, stackTrace) {
            task.isSynced = false;
            task.save();
            return ApiResult.failure(
                DioExceptionTypes.getDioException(error, stackTrace));
          }
        }
      }

      /// If there are no pending tasks, return success with null.
      return const ApiResult.success(null);
    } catch (e) {
      logger.e('Error syncing tasks: $e');
      return ApiResult.error('Error syncing tasks: $e');
    }
  }
}
