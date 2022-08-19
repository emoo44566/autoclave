import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autoclave/addnote/model/color_model.dart';
import 'package:autoclave/core/bloc_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:autoclave/calendar/utils/date_model.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  AddNoteBloc()
      : super(AddNoteState(
            date: DateModel.today(), colorModel: ColorModel.none()));

  @override
  void onTransition(Transition<AddNoteEvent, AddNoteState> transition) {
    BlocUtils.printTransition(transition);
    super.onTransition(transition);
  }

  @override
  Stream<AddNoteState> mapEventToState(AddNoteEvent event) async* {
    if (event is AddNoteDateChanged) {
      yield state.copyWith(
        date: event.date,
      );
    } else if (event is AddNoteTitleChanged) {
      yield state.copyWith(
        title: event.title,
      );
    } else if (event is AddNoteBodyChanged) {
      yield state.copyWith(
        body: event.body,
      );
    } else if (event is AddNoteFormSubmitted) {
      yield AddNoteState(
          date: DateModel.today(), colorModel: ColorModel.none());
    } else if (event is AddNoteColorChanged) {
      yield state.copyWith(colorModel: event.colorModel);
    }
    // else if (event is PasswordChanged) {
    //   final password = Password.dirty(event.password);
    //   yield state.copyWith(
    //     password: password.valid ? password : Password.pure(event.password),
    //     status: Formz.validate([state.email, password]),
    //   );
    // } else if (event is EmailUnfocused) {
    //   final email = Email.dirty(state.email.value);
    //   yield state.copyWith(
    //     email: email,
    //     status: Formz.validate([email, state.password]),
    //   );
    // } else if (event is PasswordUnfocused) {
    //   final password = Password.dirty(state.password.value);
    //   yield state.copyWith(
    //     password: password,
    //     status: Formz.validate([state.email, password]),
    //   );
    // } else if (event is FormSubmitted) {
    //   final email = Email.dirty(state.email.value);
    //   final password = Password.dirty(state.password.value);
    //   yield state.copyWith(
    //     email: email,
    //     password: password,
    //     status: Formz.validate([email, password]),
    //   );
    // if (state.status.isValidated) {
    //   yield state.copyWith(status: FormzStatus.submissionInProgress);
    //   await Future<void>.delayed(const Duration(seconds: 1));
    //   yield state.copyWith(status: FormzStatus.submissionSuccess);
    // }
    // }
  }
}
