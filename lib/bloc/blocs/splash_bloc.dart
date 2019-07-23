import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:community/bloc/events/splash_event.dart';
import 'package:community/bloc/states/splash_state.dart';
import 'package:community/graphql/queries.dart';
import 'package:community/vendor/globals.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  @override
  SplashState get initialState => InitialSplashState();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    print(event);
    if (event is CheckIfTokenPresentEvent) {
      yield GettingUserCredentialsState();
      yield* checkReduxStore();
    }
    if (event is CheckIfTokenValidEvent) {
      yield AuthenticatingUserState();
      yield* validateAuthUser();
    }
  }

  Stream<SplashState> checkReduxStore() async* {
    if (store.state.authUser != null && store.state.authUser.accessToken != null) {
      dispatch(CheckIfTokenValidEvent());
    } else {
      yield UnknownUserCredentialsState();
    }
  }

  Stream<SplashState> validateAuthUser() async* {
    yield await graphQLClient.value
        .query(QueryOptions(
      document: Queries.validateToken,
    ))
        .then((QueryResult response) {
      // TODO - Specific states for Specific errors... awaiting graphql-flutter PR #355
      if (response.hasErrors) {
        return FailedAuthenticationState();
      } else {
        return SuccessfulAuthenticationState();
      }
    });
  }
}
