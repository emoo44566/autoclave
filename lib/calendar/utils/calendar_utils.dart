import 'package:flutter/material.dart';

import 'date_model.dart';

class CalendarUtils {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  CalendarUtils._();

  static List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  static List<DayModel> getMonthDayList(DateModel selectedDate,
      DateModel todayDate, MaterialLocalizations localizations) {
    var year = selectedDate.year;
    var month = selectedDate.month;
    var m = List<DayModel>.filled(42, DayModel(0, false, false, 0));
    var fdw = DateUtils.firstDayOffset(year, month, localizations);

    bool k = false;
    if (year == todayDate.year && month == todayDate.month) k = true;

    for (int i = 0; i < DateUtils.getDaysInMonth(year, month); i++) {
      m[i + fdw] = DayModel(i + 1, (i + 1 == selectedDate.day),
          (k && (i + 1 == todayDate.day)), 2);
      // print("$i $fdw ${m[i + fdw].dayInMonth} ${m[i + fdw - 1].dayInMonth}");
    }
    return m;
  }

  static int getDaysInMonth(int year, int month) {
    return DateUtils.getDaysInMonth(year, month);
  }
}

class DayModel {
  DayModel(this.dayInMonth, this.isSelected, this.isToday, this.noteCounts);
  int dayInMonth = 0;
  bool isSelected = false;
  bool isToday = false;
  int noteCounts = 0;
}
