import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autoclave/calendar/views/calendar_day_item.dart';
import '../calendar.dart';

class CalendarBody extends StatelessWidget {
  final double width;

  CalendarBody({required this.width});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CalendarBloc>().state;

    final double itemWidth = (width - 40) / 7;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: itemWidth / 1.5,
          // decoration: BoxDecoration(
          //   color: Colors.green.withAlpha(140),
          //   borderRadius: BorderRadius.circular(6),
          // ),
          child: GridView.count(
            crossAxisCount: 7,
            childAspectRatio: 1.6,
            children: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
                .map<Widget>((dm) {
              return Container(
                // decoration: BoxDecoration(
                //   color: Colors.blue.withAlpha(140),
                //   borderRadius: BorderRadius.circular(6),
                // ),
                child: Center(
                  child: Text(
                    dm,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          height: itemWidth * 5.4,
          // decoration: BoxDecoration(
          //   color: Colors.red.withAlpha(140),
          //   borderRadius: BorderRadius.circular(6),
          // ),
          child: GridView.count(
            crossAxisCount: 7,
            childAspectRatio: 1.2,
            children: CalendarUtils.getMonthDayList(state.selectedDate,
                    state.todayDate, MaterialLocalizations.of(context))
                .map<Widget>((dayModel) {
              return CalendarDayItem(
                dayModel: dayModel,
                circleCount: dayModel.dayInMonth > 0
                    ? state.noteCountList[dayModel.dayInMonth - 1]
                    : 0,
                onTap: () {
                  context
                      .read<CalendarBloc>()
                      .add(CalendarDaySelected(day: dayModel.dayInMonth));
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
