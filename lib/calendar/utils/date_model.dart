import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'calendar_utils.dart';

class DateModel extends Equatable implements Comparable<DateModel> {
  final int year;
  final int month;
  final int day;

  DateModel(this.year, this.month, this.day);

  @override
  int compareTo(DateModel other) {
    var dt = DateTime(year, month, day);
    return dt.compareTo(DateTime(other.year, other.month, other.day));
  }

  @override
  String toString() {
    return "($year, $month, $day)";
  }

  @override
  List<Object> get props => [year, month, day];

  static today() {
    var dt = DateTime.now();
    return DateModel(dt.year, dt.month, dt.day);
  }

  DateModel nextMonth() {
    int y, m;
    if (month == 12) {
      y = year + 1;
      m = 1;
    } else {
      y = year;
      m = month + 1;
    }
    return DateModel(y, m, _daycorrection(y, m, day));
  }

  DateModel prevMonth() {
    int y, m;
    if (month == 1) {
      y = year - 1;
      m = 12;
    } else {
      y = year;
      m = month - 1;
    }
    return DateModel(y, m, _daycorrection(y, m, day));
  }

  DateModel changeDay(int day) {
    return DateModel(year, month, day);
  }

  _daycorrection(int y, int m, int d) {
    if (d > DateUtils.getDaysInMonth(y, m))
      return DateUtils.getDaysInMonth(y, m);
    else
      return d;
  }

  String toStandardString() {
    return "$day ${CalendarUtils.months[month - 1]} $year";
  }

  toYearMonthString() {
    return "$year ${CalendarUtils.months[month - 1]}";
  }
}
