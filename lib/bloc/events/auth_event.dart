import 'package:community/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  User user;
}

class AttemptLoginEvent extends AuthEvent {
  Map<String, dynamic> value;

  AttemptLoginEvent({this.value});
}

class AttemptRegisterEvent extends AuthEvent {}

class AttemptLogoutEvent extends AuthEvent {}
