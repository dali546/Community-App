import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class UnauthenticatedUserState extends AuthState {}

class AuthenticatingUserState extends AuthState {}

class FailedAuthenticationState extends AuthState {}

class SuccessfulAuthenticationState extends AuthState {
  var data;

  SuccessfulAuthenticationState({this.data});
}

class LoggedInState extends AuthState {}
