class StringsManager {
  StringsManager._internal();
  static final StringsManager _instance = StringsManager._internal();
  factory StringsManager() => _instance;

  static String appTitle = "ToDo App";

  static String welcome = "Hello Friend 👋";

  static String noRouteFound = "No Route Found";
  static String anErrorOccurred = "An Error Occurred";

  static String noTasksFound = "No Tasks Found";

  static String homeHeadLine = "Ready to do your\nDaily Tasks??";
  static String today = "Today's";

  static String doneState = "Done";
  static String inProgressState = "In Progress";
  static String upDateTask = "Update Task";
  static String createNewTask = "Create New Task";

  static String updatedAt = "Updated At:";
  static String createdAt = "Created At:";

  static String title = "Title";
  static String description = "Description";

  static String descRequired = "Description is required";

  static String titleRequired = "Title is required";
}
