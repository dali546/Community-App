import 'package:community/bloc/blocs/main_screen_bloc.dart';
import 'package:community/view/launch/splash_screen_view.dart';
import 'package:community/view/main/main_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new SplashComponent();
});

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BlocProvider(
      builder: (context) => MainScreenBloc(), child: MainScreen());
});
