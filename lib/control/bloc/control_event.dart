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
