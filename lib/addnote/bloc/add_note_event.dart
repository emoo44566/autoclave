part of 'add_note_bloc.dart';

abstract class AddNoteEvent extends Equatable {
  const AddNoteEvent();

  @override
  List<Object> get props => [];
}

class AddNoteDateChanged extends AddNoteEvent {
  const AddNoteDateChanged({required this.date});

  final DateModel date;

  @override
  List<Object> get props => [date];

  String toString() => "AddNoteDateChanged $date";
}

class AddNoteColorChanged extends AddNoteEvent {
  const AddNoteColorChanged({required this.colorModel});

  final ColorModel colorModel;

  @override
  List<Object> get props => [colorModel];

  String toString() => "AddNoteColorChanged $colorModel";
}

class AddNoteTitleChanged extends AddNoteEvent {
  const AddNoteTitleChanged({required this.title});

  final String title;

  @override
  List<Object> get props => [title];

  String toString() => "AddNoteTitleChanged $title";
}

class AddNoteBodyChanged extends AddNoteEvent {
  const AddNoteBodyChanged({required this.body});

  final String body;

  @override
  List<Object> get props => [body];

  String toString() => "AddNoteBodyChanged $body";
}

class AddNoteFormSubmitted extends AddNoteEvent {
  String toString() => "AddNoteFormSubmitted";
}

class PasswordChanged extends AddNoteEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends AddNoteEvent {}

class FormSubmitted extends AddNoteEvent {}
