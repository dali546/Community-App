import 'package:community/components/launch/homeComponent.dart';
import 'package:community/components/launch/splashComponent.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var splashHandler = new Handler(
    type: HandlerType.route,
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new SplashComponent();
    });

var homeHandler = new Handler(
    type: HandlerType.route,
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new HomeComponent();
    });
