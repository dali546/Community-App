import 'package:community/redux/redux.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

final Router router = Router();
Store<AppState> store;
ValueNotifier<GraphQLClient> graphQLClient;

initialiseGlobals() async {
  store = await setupRedux();

  final Link link = AuthLink(getToken: () async {
    return "Bearer ${store.state.authUser == null ? "" : store.state.authUser.accessToken ?? ""}";
  }).concat(HttpLink(uri: "${store.state.serverURL}/graphql"));

  graphQLClient = ValueNotifier(
    GraphQLClient(cache: InMemoryCache(), link: link),
  );
}

Future<Store<AppState>> setupRedux() async {
  // Persistor - Stores Redux for next app startup, using JSON
  final persistor = Persistor<AppState>(
    debug: true,
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  // Load initial state - Load existing state -- calls AppState.fromJson method
  final initialState = await persistor.load();
  // Create Store - Holds global configuration of the app.
  final store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware: [
      persistor.createMiddleware(), // calls toJson to save config
      new LoggingMiddleware.printer(formatter: customReduxLogFormatter)
    ],
  );
  return store;
}

String customReduxLogFormatter<AppState>(AppState state, dynamic action, DateTime timestamp) {
  return "{Action: $action, Description: ${action.getDescription()}, State: $state, Timestamp: ${DateTime.now()}}";
}
