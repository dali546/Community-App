// The Redux Store

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppState {
  final String appName;
  final ThemeData themeData;

  AppState({@required this.appName, @required this.themeData});

  factory AppState.initial() {
    return AppState(
        appName: "Community - Initial State",
        themeData: ThemeData.dark()
    );
  }

  AppState copyWith({
    String appName, ThemeData themeData
  }) {
    return AppState(
      appName: appName ?? this.appName,
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  int get hashCode => hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppState && appName == other.appName;
}
