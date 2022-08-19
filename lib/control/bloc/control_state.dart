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
  String toString() => "ControlInitial ${super}";
}

class ControlPreCheck extends ControlState {
  // check for water - doors - gas
  const ControlPreCheck(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlPreCheck ${super}";
}

class ControlStart extends ControlState {
  const ControlStart(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlStart ${super}";
}

class ControlInGoal extends ControlState {
  const ControlInGoal(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlInGoal ${super}";
}

class ControlAfterGoal extends ControlState {
  const ControlAfterGoal(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlAfterGoal ${super}";
}

class ControlFinished extends ControlState {
  const ControlFinished(ControlModel controlModel)
      : super(controlModel: controlModel);

  @override
  String toString() => "ControlFinished ${super}";
}
