import 'package:community/redux/actions/ui_actions.dart';
import 'package:community/redux/app_state.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeComponent extends StatefulWidget {
  @override
  _HomeComponentState createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  final appNameTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of<AppState>(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Center(
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
            Center(
              child: new TextField(controller: appNameTextController)
            ),
            Center(
              child: new FlatButton(
                  onPressed: () {
                    store.dispatch(ChangeApplicationNameAction(appNameTextController.text));
                  },
                  child: new Text("Change App name")),
            ),
            Center(
              child: StoreConnector<AppState, String>(
                converter: (store) => store.state.appName,
                builder: (context, name) {
                  return new Text("Application Name is $name");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
