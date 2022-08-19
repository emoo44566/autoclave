import 'package:flutter/material.dart';
import 'package:autoclave/calendar/utils/calendar_utils.dart';

import '../calendar.dart';

class CalendarDayItem extends StatelessWidget {
  final DayModel dayModel;
  final int circleCount;
  final VoidCallback? onTap;

  const CalendarDayItem(
      {Key? key,
      required this.dayModel,
      required this.onTap,
      required this.circleCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (dayModel.dayInMonth == 0)
      return Container(
        color: Colors.transparent,
      );
    else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: (dayModel.isToday)
                ? Colors.blue.withAlpha(140)
                : (dayModel.isSelected)
                    ? Colors.black38
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  dayModel.dayInMonth.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Positioned(
                bottom: 6,
                left: 0,
                right: 0,
                child: SizedBox(
                    height: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<int>.filled(circleCount, 0)
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(
                                  width: 4,
                                  height: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
              ),
            ],
          ),
        ),
      );
    }
  }
}
