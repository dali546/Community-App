import 'package:community/config/application.dart';
import 'package:community/config/customTheme.dart';
import 'package:community/config/globals.dart';
import 'package:community/config/routes.dart';
import 'package:community/redux/app_state.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/src/store.dart';

/// Components will be the foundation of application views
/// The folder structure is broken like so -
/// * launch - These relate to the start of the application
/// * auth - Auth related views
/// * dash - Main Dashboard views
/// * Misc - TODO If More pages etc

/// AppComponent defines the MaterialApp and initialises the routes
/// This is the Main App Runner.
class AppComponent extends StatefulWidget {
  final Store<AppState> store;

  AppComponent({Key key, this.store}) : super(key: key);

  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {

  _AppComponentState() {
    // Configure Application Routes Navigator
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => CustomTheme.buildTheme(brightness),
        themedWidgetBuilder: (BuildContext context, themeData) {
          return new MaterialApp(
            title: "Community",
            theme: themeData,
            onGenerateRoute: Application.router.generator,
          );
        });
  }
}
