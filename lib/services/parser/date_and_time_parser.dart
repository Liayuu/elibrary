import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String defaultDateFormat = "dd-MM-yyyy";
const String defaultStringDateFormat = "dd MMMM yyyy";
const String defaultDateTimeFormat = "yyyy-MM-dd HH:mm:ss";
const String defaultTimeFormat = "HH:mm";

//add time setting here

DateTime stringToDate({required String date, String? format}) {
  return DateFormat(format ?? defaultDateFormat).parse(date);
}

String dateToString({required DateTime date, String? format}) {
  return DateFormat(format ?? defaultStringDateFormat).format(date);
}

TimeOfDay stringToTime({required String time, String? format}) {
  var timeFormat = DateFormat(format ?? defaultTimeFormat);
  return TimeOfDay.fromDateTime(timeFormat.parse(time));
}

String timeToString({required TimeOfDay time, bool isUse24 = true, required BuildContext context}) {
  return MaterialLocalizations.of(context).formatTimeOfDay(time, alwaysUse24HourFormat: isUse24);
}

class DateHelper {
  static DateTime? dateTimeFromJson(String? dateString) =>
      dateString != null ? DateFormat(defaultDateTimeFormat).parse(dateString) : null;

  // static DateTime? dateTimeTemporary(String dateString) =>
  //     DateFormat(defaultDateTimeFormat).parse(dateString);

  static String? dateTimeToJson(DateTime? dateTime) =>
      DateFormat(defaultDateTimeFormat).format(dateTime ?? DateTime.now());

  // static String? dateTimeToJsonTemporary(DateTime? dateTime) =>
  //     DateFormat(defaultDateTimeFormat).format(dateTime ?? DateTime.now());
}
