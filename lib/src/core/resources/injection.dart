import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get_it/get_it.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/src/core/web_services/connection_helper.dart';
import 'package:todo_app/src/core/web_services/web_services.dart';
import 'package:todo_app/src/features/home/data/local_data_source/todo_db_service.dart';
import 'package:todo_app/src/features/home/data/remote_data_source/remote_data_source.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';
import 'package:todo_app/src/features/home/logic/get_todo/get_todo_cubit.dart';

import 'constants.dart';

final getIt = GetIt.instance;
Dio dio = Dio();

Future<void> initGetIt() async {
  getIt.registerLazySingleton<InternetConnectionHelper>(
      () => InternetConnectionHelper());

  getIt.registerLazySingleton<GetToDoCubit>(() => GetToDoCubit(getIt()));

  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
  getIt.registerLazySingleton<ToDoApiHandler>(() => ToDoApiHandler(getIt()));
  getIt.registerLazySingleton<ToDoDBService>(() => ToDoDBService());

  getIt.registerLazySingleton<ToDoRepository>(
      () => ToDoRepository(dbService: getIt(), toDoApiHandler: getIt()));

  // await Hive.initFlutter();
  // getIt.registerLazySingleton<HomeDBService>(() => HomeDBService());
  // await getIt<HomeDBService>().initDataBase();

  // getIt.registerLazySingleton<WebServices>(
  //   () => WebServices(createAndSetupDio()),
  // );
  // getIt.registerLazySingleton<HomeDataBaseProvider>(
  //   () => HomeDataBaseProvider(homeDataBaseService: getIt()),
  // );

  // // getIt.registerLazySingleton<HomeRemoteProvider>(
  // //   () => HomeRemoteProvider(webServices: getIt()),
  // // );

  // getIt.registerLazySingleton<HomeRepository>(
  //   () => HomeRepository(dbProvider: getIt(), webServices: getIt()),
  // );
  // getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());
  // getIt.registerLazySingleton<HomeLogicCubit>(() => HomeLogicCubit(getIt()));
}

Dio createAndSetupDio() {
  dio
        ..options.connectTimeout = const Duration(seconds: 10)
        ..options.receiveTimeout = const Duration(seconds: 10)
        ..options.baseUrl = AppConstants.domain
      // ..options.headers = {
      //   // 'Content-Type': 'application/json',
      //   // 'Accept': 'application/json',
      //   // 'accept-language': 'ar',
      //   'Authorization': 'Bearer $token',
      //   // 'Accept': 'application/json',
      // }
      ;

  dio.interceptors.add(
    RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 4, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before the first retry
        Duration(seconds: 2), // wait 2 sec before the second retry
        Duration(seconds: 3), // wait 3 sec before the third retry
        Duration(seconds: 4), // wait 4 sec before the fourth retry
      ],
    ),
  );

  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      error: true,
      requestHeader: true,
      responseHeader: false,
      responseBody: true,
      request: true,
    ),
  );
  return dio;
}
