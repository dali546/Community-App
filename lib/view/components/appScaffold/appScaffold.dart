import 'package:community/view/components/appBar/customAppBarBuilder.dart';
import 'package:community/view/components/navBar/customNavBar.dart';
import 'package:flutter/material.dart';

// This will be a custom Scaffold with fixed Nav and App Bar (for now)
// This ensures consistency throughout the App
class AppScaffold extends Scaffold {
  AppScaffold({
    @required Widget body,
  }) : super(
          appBar: CustomAppBarBuilder(),
          body: body,
          bottomNavigationBar: CustomBottomNavBar(),
        );
}
