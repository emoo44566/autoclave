import 'package:flutter/material.dart';
import 'package:autoclave/note/views/note_item.dart';

import '../note.dart';

class NoteItemGroup extends StatelessWidget {
  final String title;
  final List<NoteModel> noteModelList;
  final VoidCallback? onTap;

  const NoteItemGroup(
      {Key? key,
      required this.title,
      required this.noteModelList,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, //fromRGBO(210, 240, 244, 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.left,
            ),
            const Divider(
              height: 6,
              thickness: 2,
              indent: 2,
              endIndent: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: noteModelList
                    .map<Widget>((noteModel) =>
                        NoteItem(noteModel: noteModel, onTap: onTap))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
