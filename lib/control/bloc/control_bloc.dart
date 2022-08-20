import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autoclave/core/bloc_utils.dart';

import '../utils/control_model.dart';

part 'control_event.dart';
part 'control_state.dart';

class ControlBloc extends Bloc<ControlEvent, ControlState> {
  ControlBloc(super.initialState) {
    on<ControlNextStep>((event, emit) => {
          if (state is ControlInitial)
            emit(ControlPreCheck(state.controlModel))
          else if (state is ControlPreCheck)
            emit(ControlStart(state.controlModel))
          else if (state is ControlStart)
            emit(ControlInGoal(state.controlModel, 0))
          else if (state is ControlInGoal)
            emit(ControlAfterGoal(state.controlModel))
          else if (state is ControlAfterGoal)
            emit(ControlFinished(state.controlModel))
          else if (state is ControlFinished)
            emit(const ControlInitial(ControlModel(23, 15)))
        });

    on<ControlUpdateStep>((event, emit) => {
          if (state is ControlInitial)
            emit(ControlInitial(event.controlModel))
          else if (state is ControlPreCheck)
            emit(ControlPreCheck(event.controlModel))
          else if (state is ControlStart)
            emit(ControlStart(event.controlModel))
          else if (state is ControlInGoal)
            emit(ControlInGoal(event.controlModel, event.seconds))
          else if (state is ControlAfterGoal)
            emit(ControlAfterGoal(event.controlModel))
          else if (state is ControlFinished)
            emit(ControlFinished(event.controlModel))
        });
  }

  @override
  void onTransition(Transition<ControlEvent, ControlState> transition) {
    BlocUtils.printTransition(transition);
    super.onTransition(transition);
  }
}
