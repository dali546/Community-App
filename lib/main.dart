import 'package:community/vendor/globals.dart';
import 'package:community/view//app_component.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialiseGlobals();
  runApp(AppComponent());
}
