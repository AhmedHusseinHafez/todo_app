import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: AppConstants.domain)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET("/todos")
  Future<List<ToDoModel>?> getToDos();

  @POST("/todos")
  Future<ToDoModel?> addToDo(@Body() ToDoModel toDoModel);

  @PUT("/todos/{id}")
  Future<ToDoModel?> updateToDo(
    @Path("id") String id,
    @Body() Map<String, dynamic> toDoModel,
  );

  @DELETE("/todos/{id}")
  Future<ToDoModel?> deleteToDo(@Path("id") String id);
}
