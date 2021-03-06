import 'package:intl/intl.dart';

class Util{
  static DateTime getDateTimeFromMilliseconds(int seconds) => DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  static String getFormattedDate(DateTime dateTime)=> DateFormat('EEE, MMM d, y').format(dateTime);
  static String getFormattedWeekDay(DateTime dateTime) => DateFormat('EEE, MMM d').format(dateTime);
  static String getFormattingTime(DateTime dateTime) => DateFormat('Hm').format(dateTime);
}