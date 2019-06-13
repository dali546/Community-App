import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:community/view/main/homeComponentView.dart';

class SplashComponent extends StatefulWidget {
  @override
  _SplashComponentState createState() => _SplashComponentState();
}

class _SplashComponentState extends State<SplashComponent> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 10,
        navigateAfterSeconds: new HomeComponentView(),
        title: new Text(
          'Welcome In SplashScreen',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}
