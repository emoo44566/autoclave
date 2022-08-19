import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autoclave/calendar/utils/date_model.dart';
import 'package:autoclave/calendar/utils/calendar_utils.dart';
import 'package:autoclave/core/bloc_utils.dart';
import 'package:autoclave/data/note_repository.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc(this.noteRepository)
      : super(
          CalendarState(
              todayDate: DateModel.today(),
              selectedDate: DateModel.today(),
              noteCountList: List<int>.filled(
                  CalendarUtils.getDaysInMonth(
                      DateModel.today().year, DateModel.today().month),
                  0)),
        );

  final NoteRepository noteRepository;

  @override
  void onTransition(Transition<CalendarEvent, CalendarState> transition) {
    BlocUtils.printTransition(transition);
    super.onTransition(transition);
  }

  @override
  Stream<CalendarState> mapEventToState(
    CalendarEvent event,
  ) async* {
    if (event is CalendarNextMonthClicked) {
      yield* _mapCalendarNextMonthClickedToState(event);
    } else if (event is CalendarPrevMonthClicked) {
      yield* _mapCalendarPrevMonthClickedToState(event);
    } else if (event is CalendarDaySelected) {
      yield* _mapCalendarDaySelectedToState(event);
    }
  }

  Stream<CalendarState> _mapCalendarNextMonthClickedToState(
      CalendarNextMonthClicked event) async* {
    var sd = state.selectedDate.nextMonth();
    var noteCountList = await noteRepository.getNotCountList(sd.year, sd.month);
    yield CalendarState(
        todayDate: state.todayDate,
        selectedDate: sd,
        noteCountList: noteCountList);
    ;
  }

  Stream<CalendarState> _mapCalendarPrevMonthClickedToState(
      CalendarPrevMonthClicked nevent) async* {
    var sd = state.selectedDate.prevMonth();
    List<int> noteCountList =
        await noteRepository.getNotCountList(sd.year, sd.month);
    yield CalendarState(
        todayDate: state.todayDate,
        selectedDate: sd,
        noteCountList: noteCountList);
  }

  Stream<CalendarState> _mapCalendarDaySelectedToState(
      CalendarDaySelected event) async* {
    yield CalendarState(
        todayDate: state.todayDate,
        selectedDate: state.selectedDate.changeDay(event.day),
        noteCountList: state.noteCountList);
  }
}
