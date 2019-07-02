import 'package:community/redux/init.dart';
import 'package:community/redux/redux.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final Router router = Router();
Store<AppState> store;
ValueNotifier<GraphQLClient> client;

initialiseGlobals() async {
  // Redux Store Setup
  store = await setupRedux();

  // GraphQL Client Setuo
  client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(uri: "${store.state.serverURL}/graphql"),
    ),
  );
}
