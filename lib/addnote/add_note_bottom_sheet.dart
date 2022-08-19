import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autoclave/addnote/add_note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autoclave/addnote/views/color_selector.dart';
import 'package:autoclave/calendar/utils/date_model.dart';
import 'package:autoclave/data/note_repository.dart';
import 'package:autoclave/note/note.dart';
import 'package:autoclave/main/views/views.dart';

class AddNoteBottomSheet extends StatelessWidget {
  final BuildContext parentContext;
  AddNoteBottomSheet(this.parentContext);

  Widget counter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    return Text(
      '$currentLength of $maxLength characters',
      semanticsLabel: 'character count',
      style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 9),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MBottomSheet(
      title: "Add Note",
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            maxLength: 24,
            buildCounter: counter,
            style: Theme.of(context).textTheme.bodyText2,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  gapPadding: 10.0,
                ),
                hintText: 'Enter title'),
            onChanged: (var s) {
              print(s);
              parentContext
                  .read<AddNoteBloc>()
                  .add(AddNoteTitleChanged(title: s));
            },
          ),
          SizedBox(
            height: 3,
          ),
          TextField(
            maxLength: 36,
            buildCounter: counter,
            style: Theme.of(context).textTheme.bodyText2,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  gapPadding: 10.0,
                ),
                hintText: 'Enter body'),
            onChanged: (var s) {
              print(s);
              parentContext
                  .read<AddNoteBloc>()
                  .add(AddNoteBodyChanged(body: s));
            },
          ),
          SizedBox(
            height: 3,
          ),
          ColorItemSelector(
            title: "ُSelect Color",
            colorNameList: [ColorName.green, ColorName.blue, ColorName.red],
            onTap: () {},
            onItemSelected: (ColorModel colorModel) {
              print(colorModel.colorName);
              parentContext
                  .read<AddNoteBloc>()
                  .add(AddNoteColorChanged(colorModel: colorModel));
            },
          ),
          SizedBox(
            height: 120,
            child: Transform.scale(
              scale: .7,
              alignment: Alignment.topCenter,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (var d) {
                  parentContext.read<AddNoteBloc>().add(AddNoteDateChanged(
                      date: DateModel(d.year, d.month, d.day)));
                },
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
      buttonText: 'Add',
      buttonOnPressed: () {
        var s = parentContext.read<AddNoteBloc>().state;
        if (s.title.isEmpty) {
          _createMessage(context, "Title must not be empty.");
        } else if (s.colorModel.colorName == ColorName.none) {
          _createMessage(context, "Color is not selected.");
        } else if (s.body.isEmpty) {
          _createMessage(context, "Body must not be empty.");
        } else {
          parentContext.read<NoteBloc>().add(NoteAddNoteClicked(
                  note: NoteModel(
                s.date,
                s.title,
                s.body,
                s.colorModel,
              )));
          parentContext.read<AddNoteBloc>().add(AddNoteFormSubmitted());
          Navigator.pop(parentContext);
        }
      },
    );
  }

  static void showModalBottomSheetM(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        backgroundColor: Colors.white,
        builder: (builder) {
          return AddNoteBottomSheet(context);
        });
  }

  void _createMessage(BuildContext context, String body) {
    var a = _createOverlayEntry(context, body);
    Overlay.of(context)?.insert(a);
    Future.delayed(const Duration(milliseconds: 1200), () {
      a.remove();
    });
  }

  OverlayEntry _createOverlayEntry(BuildContext context, String body) {
    // RenderBox? renderBox = context.findRenderObject();
    // var size = renderBox ?? renderBox?.size;
    // var offset = renderBox ?? renderBox?.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: 30, //offset.dx,
        right: 30,
        top: MediaQuery.of(context).size.height * .5 -
            100, // offset.dy + size.height + 5.0,
        width: 200, // size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(body, style: Theme.of(context).textTheme.bodyText2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
