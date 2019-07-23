import 'package:community/bloc/bloc.dart';
import 'package:community/view/auth/auth_view.dart';
import 'package:community/view/launch/splash_screen_view.dart';
import 'package:community/view/main/main_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var rootHandler =
    new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BlocProvider<SplashBloc>(builder: (context) => SplashBloc(), child: SplashView());
});

var authHandler =
    new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BlocProviderTree(blocProviders: [
    BlocProvider<AuthBloc>(builder: (BuildContext context) => AuthBloc()),
    BlocProvider<AuthScreenBloc>(builder: (BuildContext context) => AuthScreenBloc())
  ], child: AuthScreen());
});

var homeHandler =
    new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BlocProviderTree(blocProviders: [
    BlocProvider<MainScreenBloc>(builder: (context) => MainScreenBloc()),
    BlocProvider<AuthBloc>(builder: (context) => AuthBloc())
  ], child: MainScreen());
});
