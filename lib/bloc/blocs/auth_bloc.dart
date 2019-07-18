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
      yield* register(event.user);
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
      print("fails");
      yield FailedAuthenticationState();
    } else {
      print("success");
      print(result.data);
      store.dispatch(SaveUserDetailsAction(json: result.data["login"]));
      yield SuccessfulAuthenticationState(data: result.data);
    }
  }

  Stream<AuthState> register(user) async* {}

  Stream<AuthState> logout(user) async* {}
  
}
