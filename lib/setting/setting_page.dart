import 'package:flutter/material.dart';
import 'package:autoclave/main/views/app_bar_stack.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // Background(),
          SizedBox.expand(
            child: Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.0),
                    child: Text("vxcvssqeq"),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Text("xcvssqeq"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppBarOnStack(title: "Setting"),
        ],
      ),
    );
  }
}
