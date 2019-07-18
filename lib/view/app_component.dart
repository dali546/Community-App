import 'package:community/redux/app_state.dart';
import 'package:community/vendor//routes.dart';
import 'package:community/vendor//themes.dart';
import 'package:community/vendor/globals.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

/// AppComponent defines the MaterialApp and initialises the routes
/// This is the Main App Runner.
class AppComponent extends StatefulWidget {
  AppComponent({Key key}) : super(key: key);

  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    // Configure Application Routes Navigator
    Routes().defineRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => CustomTheme.buildTheme(brightness),
        themedWidgetBuilder: (BuildContext context, themeData) {
          return StoreProvider<AppState>(
            store: store,
            child: new MaterialApp(
              debugShowCheckedModeBanner: false,
              title: store.state.appName,
              theme: themeData,
              onGenerateRoute: router.generator,
            ),
          );
        });
  }
}
