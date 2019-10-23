import 'package:bloc/bloc.dart';
import 'package:community/bloc/events/auth_event.dart';
import 'package:community/bloc/states/auth_state.dart';
import 'package:community/graphql/queries.dart';
import 'package:community/redux/redux.dart';
import 'package:community/vendor/globals.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => UnauthenticatedUserState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AttemptLoginEvent) {
      yield* login(event.value);
    }
    if (event is AttemptRegisterEvent) {
      yield* register(event.value);
    }
    if (event is AttemptLogoutEvent) {
      yield* logout(event.user);
    }
  }

  Stream<AuthState> login(Map<String, dynamic> value) async* {
    QueryResult result = await graphQLClient.value.mutate(MutationOptions(
      document: Queries.login,
      variables: {
        "input": {
          "username": value['username'],
          "password": value['password'],
        },
      },
    ));
    if (result.hasErrors) {
      print(result.errors);
      yield FailedAuthenticationState();
    } else {
      print(result.data);
      store.dispatch(SaveUserDetailsAction(json: result.data["login"]));
      yield SuccessfulAuthenticationState();
    }
  }

  Stream<AuthState> register(Map<String, dynamic> value) async* {
    yield AuthenticatingUserState();
    QueryResult result = await graphQLClient.value.mutate(MutationOptions(
      document: Queries.register,
      variables: {
        "input": {
          "username": value['username'],
          "email": value['email'],
          "password": value['password'],
          "password_confirmation": value['password_confirmation'],
        }
      },
    ));
    if (result.hasErrors) {
      print(result.errors);
      yield FailedAuthenticationState();
    } else {
      print(result.data);
      store.dispatch(SaveUserDetailsAction(json: result.data['register']));
      yield SuccessfulAuthenticationState();
    }
  }

  Stream<AuthState> logout(user) async* {
    yield AuthenticatingUserState();
    QueryResult result =
        await graphQLClient.value.mutate(MutationOptions(document: Queries.logout));
    if (result.hasErrors) {
      print(result.errors);
      yield FailedLogoutState();
    } else {
      print(result.data);
      store.dispatch(LogoutAction());
      yield SuccessfulLogoutState();
    }
  }
}
