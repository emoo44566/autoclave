import 'package:autoclave/control/bloc/control_bloc.dart';
import 'package:autoclave/control/utils/control_model.dart';
import 'package:flutter/material.dart';
import 'package:autoclave/main/views/app_bar_stack.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ControlBloc>().state;
    checkState(state, context);

    return SizedBox.expand(
      child: Stack(
        children: [
          // Background(),
          Image.asset('assets/images/bg.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover),
          SizedBox.expand(
            child: Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 48.0),
              child: Column(
                children: [
                  Text(
                    "صنعت سازان اسرار",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: 14),
                  ),
                  startWidget(state, context),
                  const SizedBox(height: 10),
                  if (state is ControlPreCheck ||
                      state is ControlStart ||
                      state is ControlInGoal ||
                      state is ControlAfterGoal ||
                      state is ControlFinished)
                    checkWidget(state, context),
                  const SizedBox(height: 10),
                  if (state is ControlStart ||
                      state is ControlInGoal ||
                      state is ControlAfterGoal ||
                      state is ControlFinished)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: gauge(context, "دما", 0, 150,
                                state.controlModel.temprature)),
                        const SizedBox(width: 10),
                        Expanded(
                            child: gauge(context, "فشار", 0, 4.2,
                                state.controlModel.pressure)),
                      ],
                    ),
                  const SizedBox(height: 10),
                  if (state is ControlStart ||
                      state is ControlInGoal ||
                      state is ControlAfterGoal ||
                      state is ControlFinished)
                    controlStateMessageWidget(
                        state, context, "آغاز فرایند گرمایش"),
                  const SizedBox(height: 10),
                  if (state is ControlInGoal ||
                      state is ControlAfterGoal ||
                      state is ControlFinished)
                    controlInGoalWidget(state, context,
                        (state is ControlInGoal) ? state.seconds : 960),
                  const SizedBox(height: 10),
                  if (state is ControlAfterGoal || state is ControlFinished)
                    controlStateMessageWidget(
                        state, context, "کاهش دما و فشار"),
                  const SizedBox(height: 10),
                  if (state is ControlFinished)
                    controlFinishedWidget(state, context),
                  const SizedBox(height: 10),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          const Visibility(
              visible: false, child: AppBarOnStack(title: "Control Center")),
        ],
      ),
    );
  }

  void checkState(ControlState state, BuildContext context) {
    if (state is ControlPreCheck) {
      Future.delayed(const Duration(seconds: 3), () {
        context.read<ControlBloc>().add(const ControlNextStep());
      });
    } else if (state is ControlStart) {
      double t;
      double p;
      Future.delayed(const Duration(milliseconds: 200), () {
        t = state.controlModel.temprature;
        p = state.controlModel.pressure;
        t += .7;
        if (t > 100) p += .04;

        if (t >= 121) t = 121.0;
        if (p >= 1.2) p = 1.2;
        if (t == 121.0 && p == 1.2) {
          context
              .read<ControlBloc>()
              .add(const ControlUpdateStep(ControlModel(121, 1.2), 0));
          context.read<ControlBloc>().add(const ControlNextStep());
        } else {
          context
              .read<ControlBloc>()
              .add(ControlUpdateStep(ControlModel(t, p), 0));
        }
      });
    } else if (state is ControlInGoal) {
      Future.delayed(const Duration(milliseconds: 40), () {
        if (state.seconds == 960) {
          context
              .read<ControlBloc>()
              .add(const ControlUpdateStep(ControlModel(121, 1.2), 960));
          context.read<ControlBloc>().add(const ControlNextStep());
        } else {
          context.read<ControlBloc>().add(ControlUpdateStep(
              const ControlModel(121, 1.2), state.seconds + 1));
        }
      });
    } else if (state is ControlAfterGoal) {
      double t;
      double p;
      Future.delayed(const Duration(milliseconds: 200), () {
        t = state.controlModel.temprature;
        p = state.controlModel.pressure;
        t -= .7;
        p -= .02;

        if (t < 23) t = 23;
        if (p < 0) p = 0;
        if (t == 23 && p == 0) {
          context
              .read<ControlBloc>()
              .add(const ControlUpdateStep(ControlModel(23, 0), 960));
          context.read<ControlBloc>().add(const ControlNextStep());
        } else {
          context
              .read<ControlBloc>()
              .add(ControlUpdateStep(ControlModel(t, p), 0));
        }
      });
    } else if (state is ControlFinished) {}
  }

  Container startWidget(ControlState state, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(180, 220, 220, 220),
          // backgroundBlendMode: BlendMode.colorBurn,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                if (state is ControlInitial)
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      color: const Color.fromARGB(255, 54, 199, 86),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 12.0),
                        child: Text(
                          "شروع",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(fontSize: 14),
                        ),
                      ),
                      onPressed: () => {
                            context
                                .read<ControlBloc>()
                                .add(const ControlNextStep())
                          }),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "برنامه کاری اتوکلاو",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: itemWidget(context, "دمای هدف", 121)),
                const SizedBox(width: 8),
                Expanded(child: itemWidget(context, "فشار هدف", 1.2)),
                const SizedBox(width: 8),
                Expanded(child: itemWidget(context, "مدت", 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container checkWidget(ControlState state, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(180, 220, 220, 220),
          // backgroundBlendMode: BlendMode.colorBurn,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "چک کردن وضعیت اولیه",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: itemWidgetStr(context, "میزان آب", "مناسب")),
                const SizedBox(width: 8),
                Expanded(child: itemWidgetStr(context, "درب", "بسته")),
                const SizedBox(width: 8),
                Expanded(child: itemWidgetStr(context, "شیر تخلیه", "بسته")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container controlStateMessageWidget(
      ControlState state, BuildContext context, String msg) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(180, 220, 220, 220),
          // backgroundBlendMode: BlendMode.colorBurn,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            msg,
            style:
                Theme.of(context).textTheme.headline4?.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Container controlInGoalWidget(
      ControlState state, BuildContext context, int seconds) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(180, 220, 220, 220),
          // backgroundBlendMode: BlendMode.colorBurn,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      secondsToStr(seconds),
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "رسیدن به دما و فشار هدف",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container controlFinishedWidget(ControlState state, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(180, 220, 220, 220),
          // backgroundBlendMode: BlendMode.colorBurn,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                if (state is ControlFinished)
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      color: const Color.fromARGB(255, 54, 199, 86),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 12.0),
                        child: Text(
                          "پایان",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(fontSize: 14),
                        ),
                      ),
                      onPressed: () => {
                            context
                                .read<ControlBloc>()
                                .add(const ControlNextStep())
                          }),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "پایان کامل فرایند",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget gauge(context, String title, double from, double to, double value) {
    double third = (to - from) / 3;
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(180, 220, 220, 220),
          // backgroundBlendMode: BlendMode.colorBurn,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            title,
            style:
                Theme.of(context).textTheme.headline4?.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 150,
            child: SfRadialGauge(
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
                      color: Colors.black,
                      fontSize: 9,
                      fontWeight: FontWeight.bold),
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
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: value,
                      needleStartWidth: .4,
                      needleEndWidth: 3,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Container(
                        child: Text(value.toStringAsFixed(1)),
                      ),
                      angle: 90,
                      positionFactor: .5,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemWidget(context, String title, double number) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(5, 20, 20, 20),
          border: Border.all(
            color: Color.fromARGB(20, 20, 20, 20),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12),
            ),
            Center(
              child: Text(
                number.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemWidgetStr(context, String title, String status) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(5, 20, 20, 20),
          border: Border.all(
            color: Color.fromARGB(20, 20, 20, 20),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12),
            ),
            Center(
              child: Text(
                status,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String secondsToStr(int seconds) {
    return "${(seconds ~/ 60).toString().padLeft(2, "0")}:${(seconds % 60).toString().padLeft(2, "0")}";
  }
}
