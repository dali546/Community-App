import 'package:community/components/appComponent.dart';
import 'package:community/redux/app_state.dart';
import 'package:community/redux/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [new LoggingMiddleware.printer()],
  );
  runApp(AppComponent(store: store));
}
