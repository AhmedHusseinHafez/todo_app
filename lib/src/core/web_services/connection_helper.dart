import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/src/core/resources/constants.dart';

class InternetConnectionHelper {
  /// Function to [check] if the [device] is [connected] to the [internet]
  static Future<ConnectivityResult> deviceConnectionType() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult;
  }

  /// Function to [check] if the [device] is [connected] to the [internet] by [ping] the server [google.com]
  static Future<bool> checkInternet() async {
    final Dio dio = Dio();
    try {
      ///The [head] method is used to retrieve the headers from a resource without fetching the body of the response.
      final response = await dio.head(AppConstants.googleDomain);
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  /// Function to [check] if the [device] is [connected] to the [local the server] by [ping] 
  static Future<bool> checkLocalConnection() async {
    final Dio dio = Dio();
    try {
      ///The [head] method is used to retrieve the headers from a resource without fetching the body of the response.
      final response = await dio.head(AppConstants.domain);
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
