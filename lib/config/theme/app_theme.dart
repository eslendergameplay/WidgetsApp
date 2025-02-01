import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.purpleAccent,
  Colors.orangeAccent
];

class AppTheme {
  final int selectedColor;

  const AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            'Selected Color must be between 0 and ${colorList.length - 1}');
  /*O
  :assert(selectedColor >= 0,'Selected Color must be greater than 0 or the same 0.')
  */

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3 : true,
      colorSchemeSeed: colorList[selectedColor],
      //Esto evita que en android el titulo de la appbar este a la izquierda y este en el centro.
      appBarTheme : AppBarTheme(centerTitle:true)
    );
  }
}
