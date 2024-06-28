import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:todo_app/core/resources/constants.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: AppConstants.domain)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  // @GET(AppConstants.getProducts)
  // Future<ProductsModel> getProducts();
}
