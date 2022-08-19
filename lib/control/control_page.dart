import 'package:flutter/material.dart';
import 'package:autoclave/main/views/app_bar_stack.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 120.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "برنامه کاری اتوکلاو",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: pressureWidget(context, 'دما', 121)),
                      Expanded(child: pressureWidget(context, 'فشار', 15)),
                      Expanded(child: pressureWidget(context, 'مدت', 16)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: tempR(0, 150)),
                      Expanded(child: tempR(0, 27)),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          const AppBarOnStack(title: "Control Center"),
        ],
      ),
    );
  }

  SfRadialGauge tempR(double from, double to) {
    double third = (to - from) / 3;
    return SfRadialGauge(
      title: const GaugeTitle(text: "دما"),
      axes: <RadialAxis>[
        RadialAxis(
          minimum: from,
          maximum: to,
          startAngle: 170,
          endAngle: 10,
          labelsPosition: ElementsPosition.inside,
          maximumLabels: 6,
          labelOffset: 10,
          axisLabelStyle: const GaugeTextStyle(
              color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold),
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 0,
              endValue: third,
              startWidth: 6,
              endWidth: 6,
              color: Colors.green,
            ),
            GaugeRange(
              startValue: third,
              endValue: third * 2,
              startWidth: 6,
              endWidth: 6,
              color: Colors.orange,
            ),
            GaugeRange(
              startValue: third * 2,
              endValue: third * 3,
              startWidth: 6,
              endWidth: 6,
              color: Colors.red,
            ),
          ],
          pointers: const <GaugePointer>[
            NeedlePointer(
              value: 90,
              needleStartWidth: .4,
              needleEndWidth: 3,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                child: const Text('90,0'),
              ),
              angle: 90,
              positionFactor: .5,
            ),
          ],
        )
      ],
    );
  }

  Widget pressureWidget(BuildContext context, String title, int number) {
    return Container(
      margin: const EdgeInsets.only(left: 4.0, right: 4.0, top: 15.0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(10, 20, 20, 20),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20),
            ),
            Center(
              child: Text(
                number.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
