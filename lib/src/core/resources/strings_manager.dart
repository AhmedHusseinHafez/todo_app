class StringsManager {
  StringsManager._internal();
  static final StringsManager _instance = StringsManager._internal();
  factory StringsManager() => _instance;

  static String appTitle = "ToDo App";

  static String welcome = "Hello Friend 👋";

  static String noRouteFound = "No Route Found";
  static String anErrorOccurred = "An Error Occurred";

  static String noToDosFound = "No ToDos Found";

  static String homeHeadLine = "Ready to do your\nDaily ToDos??";
  static String today = "Today's";

  static String toDoStatus = "Status";
  static String upDateToDo = "Update ToDo";
  static String createNewToDo = "Create New ToDo";

  static String updatedAt = "Updated At:";
  static String createdAt = "Created At:";

  static String title = "Title";
  static String description = "Description";

  static String descRequired = "Description is required";

  static String titleRequired = "Title is required";

  static String toDoCreated = "ToDo Created";
  static String toDoUpdated = "ToDo Updated";
  static String toDoMovedToTrash = "ToDo Moved To Trash";
  static String toDoMarkedDeleted = "ToDo Marked Deleted";
  static String delete = "Delete";
  static String isToDoCompleted = "Is ToDo Completed?";
  static String isSynced = "Is Synced?";

  static String trash = "Trash";

  static String toDosSyncedSuccessfully = "ToDos synced successfully";

  static String note =
      "Note: This Data will disappear after sync with internet.";

  static String pending = "pending";
  static String synced = "synced";
  static String failed = "failed";
  static String state = "state";
}
