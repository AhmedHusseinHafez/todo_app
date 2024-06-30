import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectionHelper {
  /// Function to [check] if the [device] is [connected] to the [internet]
  static Future<ConnectivityResult> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult;
  }
}
