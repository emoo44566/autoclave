import 'package:flutter/material.dart';

import '../note.dart';

class NoteItem extends StatelessWidget {
  final NoteModel noteModel;
  final VoidCallback? onTap;

  const NoteItem({Key? key, required this.noteModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(
                        24, 24, 24, 1), // noteModel.colorModel.getColor(),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6))),
                child: SizedBox(
                  width: 32,
                  height: 80,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            noteModel.date.day.toString(),
                            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white70),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: 12,
                            height: 12,
                            child: Container(
                              decoration: BoxDecoration(
                                color: noteModel.colorModel.getColor(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noteModel.title,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        noteModel.body,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
