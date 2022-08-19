import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autoclave/core/bloc_utils.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(super.initialState) {
    on<MainSelectTClicked>(
        ((event, emit) => emit(MainState(selectedT: event.seletedT))));
  }

  // MainBloc() : super(const MainState(selectedT: 0));

  @override
  void onTransition(Transition<MainEvent, MainState> transition) {
    BlocUtils.printTransition(transition);
    super.onTransition(transition);
  }

  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is MainSelectTClicked) {
      yield* _mapMainSelectTClickedsToState(event);
    }
  }

  Stream<MainState> _mapMainSelectTClickedsToState(
      MainSelectTClicked event) async* {
    yield MainState(selectedT: event.seletedT);
  }
}
