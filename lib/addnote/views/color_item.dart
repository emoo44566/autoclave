import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../add_note.dart';

class ColorItem extends StatelessWidget {
  final ColorModel colorModel;
  final VoidCallback? onTap;
  final bool isSelected;

  const ColorItem(
      {Key? key,
      required this.colorModel,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 32,
                height: 32,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorModel.getColor(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                right: 0,
                left: 0,
                top: 0,
                bottom: 0,
                child: Icon(
                  CupertinoIcons.check_mark_circled,
                  size: 24,
                ),
              )
          ],
        ),
      ),
    );
  }
}
