import 'package:flutter/material.dart';
import 'package:autoclave/main/views/app_bar_stack.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          // Background(),
          SizedBox.expand(
            child: Container(
              margin:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0),
                    child: SizedBox(
                      width: 140,
                      height: 120,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(10, 20, 20, 20),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "فشار",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(fontSize: 20),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "22",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70),
                      child: Text("xcvssqeq"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const AppBarOnStack(title: "Control Center"),
        ],
      ),
    );
  }
}
