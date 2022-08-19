import 'package:flutter/material.dart';
import '../main/views/app_bar_stack.dart';

class AlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background(),
        Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.0),
                child: Text("ss"),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child:  Text("swerwers"),
                  ),
                ),
              ),
            ],
          ),
        ),
        AppBarOnStack(title: "Alarm"),
      ],
    );
  }
}

