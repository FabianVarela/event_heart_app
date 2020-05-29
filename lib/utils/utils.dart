import 'package:intl/intl.dart';

class Utils {
  static String getMonthString(DateTime dateTime) =>
      DateFormat.MMMM('es').format(dateTime).substring(0, 3).toUpperCase();

  static String getDayMonth(DateTime dateTime) =>
      DateFormat.d('es').format(dateTime);

  static String getDayString(DateTime dateTime) =>
      DateFormat.EEEE('es').format(dateTime);

  static String getHourString(DateTime dateTime) =>
      DateFormat.Hm().format(dateTime);
}
