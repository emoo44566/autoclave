import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autoclave/calendar/utils/date_model.dart';
import 'package:autoclave/core/bloc_utils.dart';
import 'package:autoclave/data/note_repository.dart';
import 'package:autoclave/note/utils/note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc(this.noteRepository) : super(NoteInitial([]));

  final NoteRepository noteRepository;

  @override
  void onTransition(Transition<NoteEvent, NoteState> transition) {
    BlocUtils.printTransition(transition);
    super.onTransition(transition);
  }

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is NoteAddNoteClicked) {
      yield* _mapNoteAddNoteClickedToState(event);
    }
  }

  Stream<NoteState> _mapNoteAddNoteClickedToState(
      NoteAddNoteClicked event) async* {
    yield NoteLoading(state.noteModelList);
    await noteRepository.addNote(event.note);
    var a = await noteRepository.getAllNotes();
    yield NoteListReady(a);
    //  NoteState(
    //     noteModelList: state.noteModelList..add(event.note),
    //     selectedDate: event.note);
  }
}
