import 'package:logger/logger.dart';

var logger = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);

String dayFormate() {
  DateTime now = DateTime.now();
  // ignore: unused_local_variable
  String day;
  switch (now.weekday) {
    case DateTime.monday:
      return day = "Monday";

    case DateTime.tuesday:
      return day = "Tuesday";

    case DateTime.wednesday:
      return day = "Wednesday";

    case DateTime.thursday:
      return day = "Thursday";

    case DateTime.friday:
      return day = "Friday";

    case DateTime.saturday:
      return day = "Saturday";

    case DateTime.sunday:
      return day = "Sunday";

    default:
      return day = "Unknown";
  }
}
