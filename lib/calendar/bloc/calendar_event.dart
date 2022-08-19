part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object> get props => [];
}

class CalendarStarted extends CalendarEvent {
  final int duration;

  const CalendarStarted({required this.duration});
}

class CalendarNextMonthClicked extends CalendarEvent {
  String toString() => "CalendarNextMonthClicked";
}

class CalendarPrevMonthClicked extends CalendarEvent {
  String toString() => "CalendarPrevMonthClicked";
}

class CalendarReset extends CalendarEvent {}

class CalendarDaySelected extends CalendarEvent {
  final int day;

  const CalendarDaySelected({required this.day});

  @override
  List<Object> get props => [day];

  String toString() => "CalendarDaySelected $day";
}
