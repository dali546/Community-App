import 'package:community/vendor/routeHandlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String welcome = "/welcome";
  static String dashboard = "/dash";
  static String login = "/login";
  static String register = "/register";
  static String map = "/map";

  void defineRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(home, handler: homeHandler);
  }
}
