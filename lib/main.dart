import 'package:community/view//appComponent.dart';
import 'package:community/vendor/globals.dart';
import 'package:community/view//app_component.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialiseGlobals();
  runApp(AppComponent(store: store));
}
