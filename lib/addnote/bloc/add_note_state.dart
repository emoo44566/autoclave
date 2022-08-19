part of "add_note_bloc.dart";

class AddNoteState extends Equatable {
  const AddNoteState({
    required this.date,
    this.title = "",
    this.body = "",
    this.status = false,
    required this.colorModel,
  });

  final DateModel date;
  final String title;
  final String body;
  final bool status;
  final ColorModel colorModel;

  AddNoteState copyWith({
    DateModel? date,
    String? title,
    String? body,
    bool? status,
    ColorModel? colorModel,
  }) {
    return AddNoteState(
      date: date ?? this.date,
      title: title ?? this.title,
      body: body ?? this.body,
      status: status ?? this.status,
      colorModel: colorModel ?? this.colorModel,
    );
  }

  @override
  List<Object> get props => [date, title, body, status, colorModel];
  
  String toString() => "($date, $title, $body, $colorModel)";
}
