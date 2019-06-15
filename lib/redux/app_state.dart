// The Redux Store

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppState {
  final String appName;
  String currentRouteTitle;

  AppState({@required this.appName, this.currentRouteTitle});

  factory AppState.initial() {
    return AppState(
        appName: "Community",
        currentRouteTitle:
            "No Route Specified" // Todo move over to BLoC pattern
        );
  }

  AppState copyWith({String appName, String currentRouteTitle}) {
    return AppState(
      appName: appName ?? this.appName,
      currentRouteTitle: currentRouteTitle ?? this.currentRouteTitle,
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

  dynamic toJson() => {'appName': appName};
}
