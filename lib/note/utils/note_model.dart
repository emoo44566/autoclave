import 'package:equatable/equatable.dart';
import 'package:autoclave/addnote/model/color_model.dart';
import 'package:autoclave/calendar/utils/date_model.dart';

class NoteModel extends Equatable {
  final DateModel date;
  final String title;
  final String body;
  final ColorModel colorModel;

  NoteModel(this.date, this.title, this.body, this.colorModel);

  @override
  String toString() {
    return "($date, $title, $body $colorModel)";
  }

  @override
  List<Object> get props => [date, title, body, colorModel];
}
