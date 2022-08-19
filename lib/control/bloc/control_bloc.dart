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
            emit(ControlInGoal(state.controlModel))
          else if (state is ControlInGoal)
            emit(ControlAfterGoal(state.controlModel))
          else if (state is ControlAfterGoal)
            emit(ControlFinished(state.controlModel))
        });
  }

  @override
  void onTransition(Transition<ControlEvent, ControlState> transition) {
    BlocUtils.printTransition(transition);
    super.onTransition(transition);
  }
}
