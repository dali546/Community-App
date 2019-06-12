import 'package:community/redux/actions/action.dart';
import 'package:community/view//appComponent.dart';
import 'package:community/redux/app_state.dart';
import 'package:community/redux/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_logging/redux_logging.dart';

void main() async {
  // Create Persistor - Stores Redux for next app startup, using JSON
  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  // Load initial state - Load existing state -- calls Appstate.fromJson method
  final initialState = await persistor.load();

  // Create Store - Holds global configuration of the app.
  final store = Store<AppState>(
    appReducer,
    initialState: initialState ?? AppState.initial(),
    middleware: [
      persistor.createMiddleware(), // calls toJson to save config -- i think
      new LoggingMiddleware.printer(formatter: customReduxLogFormatter)
    ],
  );

  runApp(AppComponent(store: store));
}

String customReduxLogFormatter<AppState>(
    AppState state, dynamic action, DateTime timestamp) {
  return "{Action: $action, Description: ${action.getDescription()}, State: $state, Timestamp: ${new DateTime.now()}}";
}
