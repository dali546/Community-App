import 'package:community/models/AuthUser.dart';

class AppState {
  final String appName;
  final String serverURL;
  final AuthUser authUser;

  AppState({
    this.appName = "Community",
    this.serverURL = "http://192.168.0.5:8000",
    this.authUser,
  });

  factory AppState.initial() {
    return AppState();
  }

  AppState copyWith({
    String appName,
    String serverURL,
    AuthUser authUser,
  }) {
    return AppState(
      appName: appName ?? this.appName,
      serverURL: serverURL ?? this.serverURL,
      authUser: authUser ?? this.authUser,
    );
  }

  // Convert JSON to AppState
  static AppState fromJson(dynamic json) {
    if (json != null) {
      return AppState(
          appName: json["appName"] as String,
          serverURL: json["serverURL"] as String,
          authUser: AuthUser.fromJson(json["authUser"]));
    } else {
      return AppState.initial();
    }
  }

  dynamic toJson() => {'appName': appName, 'serverURL': serverURL, 'authUser': authUser.toJson()};
}
