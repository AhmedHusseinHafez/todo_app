class StringsManager {
  StringsManager._internal();
  static final StringsManager _instance = StringsManager._internal();
  factory StringsManager() => _instance;

  static String noRouteFound = "No Route Found";
  static String anErrorOccurred = "An Error Occurred";
}
