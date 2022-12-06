import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String currentDate() {
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy');
  String currentDate = dateFormat.format(DateTime.now());
  return currentDate;
}

String previousMonth() {
  DateTime currentDate = DateTime.now();
  var prevMonth =
      new DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
  return prevMonth.toString();
}

String currentYear() {
  DateFormat yearFormat = DateFormat('yyyy');
  String strYear = yearFormat.format(DateTime.now());
  return strYear;
}

String currentMonth() {
  DateFormat monthFormat = DateFormat('MM');
  String strMonth = monthFormat.format(DateTime.now());
  return strMonth;
}

String currentDay() {
  DateFormat dayFormat = DateFormat('dd');
  String strDay = dayFormat.format(DateTime.now());
  return strDay;
}

String formatDate(DateTime dateTime) {
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy');
  String selected = dateFormat.format(dateTime);
  return selected;
}

void allDateEnable(
    BuildContext context, TextEditingController controller) async {
  final DateTime selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1999),
    lastDate: DateTime(int.parse(currentYear()), 12, 31),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  );

  if (selected != null) {
    controller.text = formatDate(selected);
  }
}

void allDateEnable1(
    BuildContext context, TextEditingController controller) async {
  final DateTime selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(Duration(days: 5)),
    lastDate: DateTime(int.parse(currentYear()), 12, 31),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  );

  if (selected != null) {
    controller.text = formatDate(selected);
  }
}

void previousDateDisable(
    BuildContext context, TextEditingController controller) async {
  final DateTime selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(int.parse(currentYear()), 12, 31),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  );

  if (selected != null) {
    controller.text = formatDate(selected);
  }
}

void futureDateDisable(
    BuildContext context, TextEditingController controller) async {
  final DateTime selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1999),
    lastDate: DateTime.now(),
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  );

  if (selected != null) {
    controller.text = formatDate(selected);
  }
}
