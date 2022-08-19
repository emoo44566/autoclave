import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ColorName { none, blue, red, green }

class ColorModel extends Equatable {
  final ColorName colorName;

  ColorModel(this.colorName);

  @override
  String toString() {
    return "($colorName)";
  }

  @override
  List<Object> get props => [colorName];

  Color getColor() {
    switch (colorName) {  
      case ColorName.blue:
        return Color.fromRGBO(40, 30, 220, 1);
      case ColorName.red:
        return Color.fromRGBO(250, 50, 50, 1);
      case ColorName.green:
        return Color.fromRGBO(70, 245, 90, 1);
      default:
        return Colors.white;
    }
  }

  static none() {
    return ColorModel(ColorName.none);
  }
}
