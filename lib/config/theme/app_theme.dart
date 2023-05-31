import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.pink,
  Colors.orange,
  Colors.yellow,
  Colors.grey,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(
            selectedColor >= 0, 'Selected color must be greater than 0 or 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal then ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(centerTitle: true),
      );
}
