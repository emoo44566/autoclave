import 'package:equatable/equatable.dart';

class ControlModel extends Equatable {
  final double temprature;
  final double pressure;

  const ControlModel(this.temprature, this.pressure);

  @override
  String toString() {
    return "($temprature, $pressure)";
  }

  @override
  List<Object> get props => [temprature, pressure];
}
