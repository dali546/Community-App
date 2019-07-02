// The Redux Store

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppState {
  final String appName;
  final String serverURL;

  AppState({
    this.appName = "Community",
    this.serverURL = "http://192.168.0.5:8000",
  });

  factory AppState.initial() {
    return AppState();
  }

  AppState copyWith({String appName, String currentRouteTitle}) {
    return AppState(
      appName: appName ?? this.appName,
    );
  }

  // Convert JSON to AppState
  static AppState fromJson(dynamic json) {
    if (json != null) {
      return AppState(appName: json["appName"] as String);
    } else {
      return AppState.initial();
    }
  }

  dynamic toJson() => {'appName': appName, 'serverUrl': serverURL};
}
