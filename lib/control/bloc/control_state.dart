part of "control_bloc.dart";

class ControlState extends Equatable {
  final ControlModel controlModel;

  const ControlState({required this.controlModel});

  @override
  List<Object> get props => [controlModel];

  @override
  String toString() => '{ model: $controlModel }';
}

class ControlInitial extends ControlState {
  const ControlInitial(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlInitial " + super.toString();
}

class ControlPreCheck extends ControlState {
  // check for water - doors - gas
  const ControlPreCheck(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlPreCheck " + super.toString();
}

class ControlStart extends ControlState {
  const ControlStart(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlStart " + super.toString();
}

class ControlInGoal extends ControlState {
  final int seconds;

  const ControlInGoal(ControlModel controlModel, this.seconds)
      : super(controlModel: controlModel);

  @override
  List<Object> get props => [controlModel, seconds];

  @override
  String toString() => "ControlInGoal " + super.toString() + " - $seconds";
}

class ControlAfterGoal extends ControlState {
  const ControlAfterGoal(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlAfterGoal " + super.toString();
}

class ControlFinished extends ControlState {
  const ControlFinished(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlFinished " + super.toString();
}
