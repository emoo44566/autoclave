import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:autoclave/addnote/add_note.dart';
import 'package:autoclave/note/bloc/note_bloc.dart';
import 'package:autoclave/main/views/app_bar_stack.dart';
import 'package:autoclave/note/views/note_item%20group.dart';
import 'package:autoclave/note/views/note_item.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";

import 'utils/note_model.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // Background(),
      Container(
        margin: EdgeInsets.only(top: 80, bottom: 80),
        child: Center(child: Column(children: [Expanded(child: NoteList())])),
      ),

      AppBarOnStack(
        title: "Note",
        onTap: () => AddNoteBottomSheet.showModalBottomSheetM(context),
      )
    ]);
  }
}

class NoteList extends StatelessWidget {
  List<Widget> _getAllNoteItems(BuildContext context) {
    var list = context
        .watch<NoteBloc>()
        .state
        .noteModelList
        .sortedBy((element) => element.date);
    var groups = groupBy(list, (NoteModel obj) => obj.date.toYearMonthString());
    // print("---- " + groups.toString());

    return groups.keys.map<Widget>((key) {
      print(key);
      print(groups[key]);
      return NoteItemGroup(
          title: key, noteModelList: groups[key]!, onTap: () {});
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 36, left: 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _getAllNoteItems(context),
        ),
      ),
    );
  }
}
