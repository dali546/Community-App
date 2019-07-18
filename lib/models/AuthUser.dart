import 'package:community/models/user.dart';

class AuthUser {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final String tokenType;
  final User user;

  AuthUser({this.accessToken,
    this.refreshToken,
    this.expiresIn,
    this.tokenType,
    this.user});

  dynamic toJson() =>
      {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "token_type": tokenType,
        "user": user.toJson(),
      };

  static AuthUser fromJson(json) {
    return AuthUser(accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
      tokenType: json['token_type'],
      user: User.fromJson(json['user']),
    );
  }
}
