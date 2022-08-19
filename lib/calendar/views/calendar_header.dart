import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../calendar.dart';

class CalendarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CalendarBloc>().state;
    final yearStr = state.selectedDate.year.toString().padLeft(4, '0');
    final monthStr = CalendarUtils.months[state.selectedDate.month - 1];
    final dayStr = state.selectedDate.day.toString().padLeft(2, '0');
    return Container(
      // color: Colors.brown.withAlpha(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    yearStr,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    monthStr,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
          Container(
            // color: Colors.cyan.withAlpha(100),
            child: IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_left),
              onPressed: () =>
                  context.read<CalendarBloc>().add(CalendarPrevMonthClicked()),
            ),
          ),
          Container(
            // color: Colors.cyan.withAlpha(100),
            child: IconButton(
              iconSize: 40,
              icon: Icon(Icons.arrow_right),
              onPressed: () =>
                  context.read<CalendarBloc>().add(CalendarNextMonthClicked()),
            ),
          ),
        ],
      ),
    );
  }
}
