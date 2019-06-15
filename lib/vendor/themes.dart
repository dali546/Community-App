import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData buildTheme(Brightness brightness) {
    return brightness == Brightness.light ? lightTheme() : darkTheme();
  }

  static darkTheme() {
    return ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        backgroundColor: Colors.grey,
        buttonColor: Colors.white);
  }

  static lightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.lightGreen,
      accentColor: Colors.lightGreenAccent,
      backgroundColor: Colors.blueGrey,
      buttonColor: Colors.black26,
    );
  }
}
