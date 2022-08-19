import 'package:flutter/material.dart';
import 'package:autoclave/addnote/model/color_model.dart';
import 'package:autoclave/note/views/note_item.dart';

import 'color_item.dart';

typedef void OnItemSelected(ColorModel colorModel);

class ColorItemSelector extends StatefulWidget {
  final String title;
  final List<ColorName> colorNameList;
  final VoidCallback? onTap;
  final OnItemSelected onItemSelected;

  const ColorItemSelector(
      {Key? key,
      required this.title,
      required this.colorNameList,
      required this.onTap,
      required this.onItemSelected})
      : super(key: key);

  @override
  createState() => _ColorItemSelectorState();
}

class _ColorItemSelectorState extends State<ColorItemSelector> {
  ColorName _selected = ColorName.none;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.left,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.colorNameList
                .map<Widget>((colorName) => ColorItem(
                      colorModel: ColorModel(colorName),
                      onTap: () {
                        widget.onItemSelected(ColorModel(colorName));
                        setState(() {
                          _selected = colorName;
                        });
                      },
                      isSelected: colorName == _selected,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
