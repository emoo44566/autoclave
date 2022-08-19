part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class NoteStarted extends NoteEvent {
  final int duration;

  const NoteStarted({required this.duration});
}

class NoteAddNoteClicked extends NoteEvent{
  final NoteModel note;

  const NoteAddNoteClicked({required this.note});

  @override
  List<Object> get props => [note];

  String toString() => "NoteAddNoteClicked $note";
}

class NotePrevMonthClicked extends NoteEvent {}

