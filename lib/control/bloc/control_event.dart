part of 'control_bloc.dart';

abstract class ControlEvent extends Equatable {
  const ControlEvent();

  @override
  List<Object> get props => [];
}

class ControlNextStep extends ControlEvent {
  const ControlNextStep();

  @override
  List<Object> get props => [];

  @override
  String toString() => "ControlNextStep";
}

class ControlUpdateStep extends ControlEvent {
  final ControlModel controlModel;
  final int seconds;

  const ControlUpdateStep(this.controlModel, this.seconds);

  @override
  List<Object> get props => [controlModel, seconds];

  @override
  String toString() => "ControlUpdateStep";
}
