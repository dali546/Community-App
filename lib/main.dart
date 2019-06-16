import 'package:community/redux/app_state.dart';
import 'package:community/redux/init.dart';
import 'package:community/view//app_component.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() async {
  Store<AppState> store = await setupRedux();

  runApp(AppComponent(store: store));
}
