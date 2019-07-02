import 'package:community/vendor/globals.dart';
import 'package:community/view//app_component.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialiseGlobals();
  runApp(AppComponent(store: store));
}

String customReduxLogFormatter<AppState>(
    AppState state, dynamic action, DateTime timestamp) {
  return "{Action: $action, Description: ${action.getDescription()}, State: $state, Timestamp: ${new DateTime.now()}}";
}
