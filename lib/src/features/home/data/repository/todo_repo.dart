import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/app/app.dart';
import 'package:todo_app/src/core/resources/common.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/error_strings.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/web_services/api_result.dart';
import 'package:todo_app/src/core/web_services/network_exceptions.dart';
import 'package:todo_app/src/features/home/data/local_data_source/todo_db_service.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';
import 'package:todo_app/src/features/home/data/remote_data_source/remote_data_source.dart';

/// A repository that handles data operations for ToDos. This repository manages
/// both local and remote data sources and provides methods to fetch, add, update,
/// delete, and sync ToDos.
class ToDoRepository {
  /// Creates an instance of [ToDoRepository].
  ///
  /// [toDoApiHandler] is required to handle remote data operations.
  /// [dbService] is required to handle local data operations.
  ToDoRepository({
    required ToDoApiHandler toDoApiHandler,
    required ToDoDBService dbService,
  })  : _toDoApiHandler = toDoApiHandler,
        _dbService = dbService;

  final ToDoApiHandler _toDoApiHandler;
  final ToDoDBService _dbService;

  static const String _key = AppConstants.kToDoBox;
  final _toDosBox = Hive.box<ToDoModel>(_key);

  /// Fetches ToDos from the remote server if the internet connection is available,
  /// otherwise fetches from the local database. Merges remote and local ToDos
  /// if fetched from the server.
  Future<ApiResult<List<ToDoModel>?>> fetchToDos() async {
    if (kInternetConnection != ConnectivityResult.none &&
        kInternetConnection != null) {
      try {
        var remoteToDos = await _toDoApiHandler.getToDos();
        await mergeToDos(remoteToDo: remoteToDos ?? []);
        final cachedToDos = await _dbService.getAllToDos();
        if (cachedToDos != null) {
          return ApiResult.success(cachedToDos);
        } else {
          return const ApiResult.error(
              "${ErrorStrings.kReadError} Maybe [ToDoBox] empty or closed");
        }
      } catch (_) {
        // Failure (Unknown Error) - Connection is okay
        try {
          var result = await _dbService.getAllToDos();
          return ApiResult.success(result);
        } catch (error) {
          return ApiResult.error(error.toString());
        }
      }
    } else {
      // User internet connection is not safe - no internet connection
      try {
        var result = await _dbService.getAllToDos();
        return ApiResult.success(result);
      } catch (error) {
        return ApiResult.error(error.toString());
      }
    }
  }

  /// Adds a new ToDo to the local database.
  ///
  /// [toDo] is required to be added.
  Future<ApiResult<String>> addToDo({required ToDoModel toDo}) async {
    try {
      await _dbService.addToDos(toDo: toDo);
      return ApiResult.success(StringsManager.toDoCreated);
    } catch (e) {
      logger.e('${ErrorStrings.kInsertError} $e');
      return ApiResult.error('${ErrorStrings.kInsertError} $e');
    }
  }

  /// Updates an existing ToDo in the local database.
  ///
  /// [toDo] is required to be updated.
  Future<ApiResult<String>> upDateToDo({required ToDoModel toDo}) async {
    try {
      await _dbService.updateToDo(toDo: toDo);
      return ApiResult.success(StringsManager.toDoUpdated);
    } catch (e) {
      logger.e('${ErrorStrings.kUpdateError} $e');
      return ApiResult.error('${ErrorStrings.kUpdateError} $e');
    }
  }

  /// Merges remote ToDos with the local ToDos. Handles conflicts by
  /// comparing timestamps and retains the newer ToDo.
  ///
  /// [remoteToDo] is required as a list of remote ToDos to be merged.
  Future<void> mergeToDos({required List<ToDoModel> remoteToDo}) async {
    try {
      List<ToDoModel> localToDos = _toDosBox.values.toList();
      Map<String, ToDoModel> mergedToDos = {};

      // Add local toDos to the map
      for (var toDo in localToDos) {
        mergedToDos[toDo.id] = toDo;
      }

      // Merge with remote toDos
      for (var remoteToDo in remoteToDo) {
        if (mergedToDos.containsKey(remoteToDo.id)) {
          // Conflict detected, decide how to resolve (by timestamp comparison)
          final localToDo = mergedToDos[remoteToDo.id]!;
          if (remoteToDo.updatedAt != null &&
              localToDo.updatedAt != null &&
              DateTime.parse(remoteToDo.updatedAt!)
                  .isAfter(DateTime.parse(localToDo.updatedAt!))) {
            // Remote toDo is newer, overwrite local
            mergedToDos[remoteToDo.id] = remoteToDo;
          } else {
            // Local toDo is newer or they are the same
          }
        } else {
          // New remote toDo, add it to merged toDos
          mergedToDos[remoteToDo.id] = remoteToDo;
        }
      }

      // Save merged toDos back to the local storage
      await _toDosBox.clear();
      await _toDosBox.addAll(mergedToDos.values.toList());
    } catch (e) {
      logger.e('${ErrorStrings.kMergeError} $e');
    }
  }

  /// Marks a ToDo as deleted in the local database.
  ///
  /// [id] is required as the identifier of the ToDo to be marked as deleted.
  Future<void> markAsDeleted({required String id}) async {
    await _dbService.markAsDeleted(id: id);
  }

  /// Synchronizes the local ToDos with the remote server. Handles adding,
  /// updating, and deleting ToDos based on their synchronization status.
  Future<ApiResult> syncWithServer() async {
    try {
      // Retrieve pending toDos from local storage
      var pendingToDos =
          _toDosBox.values.where((toDo) => toDo.isSynced == false).toList();

      var remoteToDos = await _toDoApiHandler.getToDos();

      // Send pending toDos to the server
      for (var toDo in pendingToDos) {
        if (toDo.isDeleted) {
          // Handle deleted toDos
          try {
            if (remoteToDos != null &&
                remoteToDos
                    .map((remoteToDo) => remoteToDo.id)
                    .contains(toDo.id)) {
              await _toDoApiHandler.deleteToDo(toDo.id);
            }
            await toDo.delete(); // Remove from local storage
          } catch (error, stackTrace) {
            toDo.isSynced = false;
            toDo.save();
            return ApiResult.failure(
                DioExceptionTypes.getDioException(error, stackTrace));
          }
        } else if (remoteToDos != null &&
            remoteToDos.map((remoteToDo) => remoteToDo.id).contains(toDo.id)) {
          // Update toDos
          try {
            toDo.isSynced = true;
            toDo.save();
            await _toDoApiHandler.updateToDo(toDo.id, toDo);
          } catch (error, stackTrace) {
            toDo.isSynced = false;
            toDo.save();
            return ApiResult.failure(
                DioExceptionTypes.getDioException(error, stackTrace));
          }
        } else {
          // Add new toDos
          try {
            toDo.isSynced = true;
            toDo.save();
            await _toDoApiHandler.addToDo(toDo);
          } catch (error, stackTrace) {
            toDo.isSynced = false;
            toDo.save();
            return ApiResult.failure(
                DioExceptionTypes.getDioException(error, stackTrace));
          }
        }
      }

      return const ApiResult.success("All ToDos synced");
    } catch (e) {
      logger.e('${ErrorStrings.kSyncError} $e');
      return ApiResult.error('${ErrorStrings.kSyncError}: $e');
    }
  }
}
