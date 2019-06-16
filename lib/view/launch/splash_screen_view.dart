import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: "/home",
        title: new Text(
          'Welcome To Community SplashScreen',
        ),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
