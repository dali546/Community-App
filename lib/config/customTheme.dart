import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData buildTheme(Brightness brightness) {
    return brightness == Brightness.light ? lightTheme() : darkTheme();
  }

  static darkTheme() {
    return ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        backgroundColor: Colors.purple,
        buttonColor: Colors.green,
        textTheme: ThemeData.dark().textTheme.apply(displayColor: Colors.pink));
  }

  static lightTheme() {
    return ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: Colors.yellow,
        backgroundColor: Colors.lightBlue,
        buttonColor: Colors.red,
        textTheme: ThemeData.light().textTheme.apply(displayColor: Colors.blue));
  }
}
