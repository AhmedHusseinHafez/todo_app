import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: AppConstants.domain)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("/todos")
  Future<List<TaskModel>?> getToDos();

  @POST("/todos")
  Future<TaskModel?> addToDo(@Body() TaskModel taskModel);

  @PUT("/todos/{id}")
  Future<TaskModel?> updateToDo(
    @Path("id") String id,
    @Body() Map<String, dynamic> taskModel,
  );

  @DELETE("/todos/{id}")
  Future<TaskModel?> deleteToDo(@Path("id") String id);
}
