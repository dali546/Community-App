import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:community/config/routeHandlers.dart';

class Routes {
  static String splash = "/";
  static String home = "/home";
  static String welcome = "/welcome";
  static String dashboard = "/dash";
  static String login = "/login";
  static String register = "/register";
  static String map = "/map";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(splash, handler: splashHandler);
    router.define(home, handler: homeHandler);
  }
}
