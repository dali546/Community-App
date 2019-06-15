import 'package:community/bloc/blocs/mainScreenBloc.dart';
import 'package:community/redux/app_state.dart';
import 'package:community/vendor//routes.dart';
import 'package:community/vendor//themes.dart';
import 'package:community/vendor/globals.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
    Routes().defineRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => CustomTheme.buildTheme(brightness),
        themedWidgetBuilder: (BuildContext context, themeData) {
          return StoreProvider<AppState>(
            store: widget.store,
            child: BlocProvider(
              builder: (context) => MainScreenBloc(),
              child: new MaterialApp(
                debugShowCheckedModeBanner: false,
                title: widget.store.state.appName,
                theme: themeData,
                onGenerateRoute: router.generator,
              ),
            ),
          );
        });
  }
}
