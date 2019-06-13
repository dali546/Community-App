import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomBottomNavBar extends CurvedNavigationBar {
  CustomBottomNavBar()
      : super(
          items: <Widget>[
            InkWell(child: Icon(Icons.home)),
            InkWell(child: Icon(Icons.search)),
            InkWell(child: Icon(Icons.pin_drop)),
            InkWell(child: Icon(Icons.account_circle)),
          ],
        );
}
