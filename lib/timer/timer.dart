import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ticker.dart';
import 'bloc/timer_bloc.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromRGBO(72, 74, 126, 1)),
      ),
      title: 'Flutter Timer',
      home: BlocProvider(
        create: (_) => TimerBloc(ticker: Ticker()),
        child: const Timer(),
      ),
    );
  }
}

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Timer')),
      body: Stack(
        children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(child: TimerText()),
              ),
              Actions(),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TimerBloc>().state;
    final minutesStr =
        ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (state.duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TimerBloc>().state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (state is TimerInitial) ...[
          FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () => context
                .read<TimerBloc>()
                .add(TimerStarted(duration: state.duration)),
          ),
        ],
        if (state is TimerRunInProgress) ...[
          FloatingActionButton(
            child: const Icon(Icons.pause),
            onPressed: () => context.read<TimerBloc>().add(TimerPaused()),
          ),
          FloatingActionButton(
            child: const Icon(Icons.replay),
            onPressed: () => context.read<TimerBloc>().add(TimerReset()),
          ),
        ],
        if (state is TimerRunPause) ...[
          FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () => context.read<TimerBloc>().add(TimerResumed()),
          ),
          FloatingActionButton(
            child: const Icon(Icons.replay),
            onPressed: () => context.read<TimerBloc>().add(TimerReset()),
          ),
        ],
        if (state is TimerRunComplete) ...[
          FloatingActionButton(
            child: const Icon(Icons.replay),
            onPressed: () => context.read<TimerBloc>().add(TimerReset()),
          ),
        ]
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade500,
          ],
        ),
      ),
    );
  }
}
