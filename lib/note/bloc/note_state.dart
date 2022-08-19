part of "note_bloc.dart";

abstract class NoteState extends Equatable {
  const NoteState({required this.noteModelList});

  final List<NoteModel> noteModelList;

  @override
  List<Object> get props => [noteModelList];

  @override
  String toString() => '(list: $noteModelList)';
}

class NoteInitial extends NoteState {
  NoteInitial(List<NoteModel> noteModelList)
      : super(noteModelList: noteModelList);

  @override
  String toString() => "NoteInitial" + super.toString();
}

class NoteLoading extends NoteState {
  NoteLoading(List<NoteModel> noteModelList)
      : super(noteModelList: noteModelList);
       @override
  String toString() => "NoteLoading" + super.toString();

}

class NoteListReady extends NoteState {
  NoteListReady(List<NoteModel> noteModelList)
      : super(noteModelList: noteModelList);
       @override
  String toString() => "NoteListReady" + super.toString();
}
