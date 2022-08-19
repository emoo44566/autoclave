import 'dart:math';

import 'package:flutter/material.dart';
import 'package:autoclave/main/views/app_bar_stack.dart';

import 'views/calendar_header.dart';
import 'views/calendar_body.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size);
    double cWidth = min(500, size.width - 30);
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 100.0, bottom: 100.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(210, 240, 244, 1), //rgb(227,58,84)
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: cWidth,
              height: cWidth * 0.94,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: CalendarHeader(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CalendarBody(
                        width: cWidth - 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AppBarOnStack(title: "Calendar")
      ],
    );
  }
}
