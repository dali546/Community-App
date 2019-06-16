import 'package:community/bloc/blocs/mainScreenBloc.dart';
import 'package:community/view/launch/splashScreenComponent.dart';
import 'package:community/view/main/mainScreen.dart';
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
