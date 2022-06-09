import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Util{
  static DateTime getDateTimeFromMilliseconds(int seconds) => DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  static String getFormattedDate(DateTime dateTime)=> DateFormat('EEE, MMM d, y').format(dateTime);
  static String getFormattedWeekDay(DateTime dateTime) => DateFormat('EEE').format(dateTime);
}