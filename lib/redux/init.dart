import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'redux.dart';

// Redux Initialisation called by main();
Future<Store<AppState>> setupRedux() async {
  // Create Persistor - Stores Redux for next app startup, using JSON

//  final persistor = Persistor<AppState>(
//    storage: FlutterStorage(),
//    serializer: JsonSerializer<AppState>(AppState.fromJson),
//  );

  // Load initial state - Load existing state -- calls Appstate.fromJson method
  final initialState = AppState.initial();
  // Create Store - Holds global configuration of the app.
  final store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware: [
      // persistor.createMiddleware(), // calls toJson to save config -- i think
      new LoggingMiddleware.printer(formatter: customReduxLogFormatter)
    ],
  );
  return store;
}

String customReduxLogFormatter<AppState>(
    AppState state, dynamic action, DateTime timestamp) {
  return "{Action: $action, Description: ${action.getDescription()}, State: $state, Timestamp: ${new DateTime.now()}}";
}
