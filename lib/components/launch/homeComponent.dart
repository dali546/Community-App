import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class HomeComponent extends StatefulWidget {
  @override
  _HomeComponentState createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new FlatButton(
          onPressed: () {
            DynamicTheme.of(context).setBrightness(
                DynamicTheme.of(context).brightness == Brightness.light
                    ? Brightness.dark
                    : Brightness.light);
          },
          child: new Text("Welcome. Test App."),
        ),
      ),
    );
  }
}
