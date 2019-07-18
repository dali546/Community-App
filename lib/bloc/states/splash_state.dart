import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class InitialSplashState extends SplashState {}

class GettingUserCredentialsState extends SplashState {}

class UnknownUserCredentialsState extends SplashState {}

class AuthenticatingUserState extends SplashState {}

class SuccessfulAuthenticationState extends SplashState {}

class FailedAuthenticationState extends SplashState {}
