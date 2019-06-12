// The Redux Store

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppState {
  final String appName;

  AppState({@required this.appName});

  factory AppState.initial() {
    return AppState(
      appName: "Community - Initial State",
    );
  }

  AppState copyWith({String appName}) {
    return AppState(
      appName: appName ?? this.appName,
    );
  }

  // Convert JSON to AppState
  static AppState fromJson(dynamic json) {
    if (json != null) return AppState(appName: json["appName"] as String);
  }

  dynamic toJson() => {'appName': appName};
}
