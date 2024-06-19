import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];



class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false
  }): assert( selectedColor >= 0, 'Tiene que ser mayor igual a 0' ),  
      assert( selectedColor < colorList.length, 
        'Tiene que ser menor igual a ${ colorList.length - 1 }');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.light : Brightness.dark ,
    colorSchemeSeed: colorList[ selectedColor ],
    //configuracion por defecto de todos los appbars
    appBarTheme: const AppBarTheme(
      centerTitle: true
    )
  );

}