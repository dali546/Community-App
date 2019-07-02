import 'package:community/view/components/appBar/custom_app_bar.dart';
import 'package:community/view/components/navBar/custom_nav_bar.dart';
import 'package:flutter/material.dart';

// This will be a custom Scaffold with fixed Nav and App Bar (for now)
// This ensures consistency throughout the App
class AppScaffold extends StatelessWidget {
  final body;

  AppScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new CustomAppBar(),
      body: body,
      bottomNavigationBar: new CustomBottomNavBar(),
    );
  }
}
