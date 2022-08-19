part of "calendar_bloc.dart";

class CalendarState extends Equatable {
  final DateModel todayDate;
  final DateModel selectedDate;
  final List<int> noteCountList;

  const CalendarState(
      {required this.todayDate,
      required this.selectedDate,
      required this.noteCountList});

  @override
  List<Object> get props => [todayDate, selectedDate];

  @override
  String toString() => 'S { today: $todayDate, selected: $selectedDate}';
}
