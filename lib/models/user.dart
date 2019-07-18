import 'package:community/models/profile.dart';

class User {
  final String username;
  final Profile profile;

  User({this.username, this.profile});

  dynamic toJson() => {"username": username};

  static fromJson(json) {
    return User(username: json["username"]);
  }
}
