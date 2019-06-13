import 'package:community/view/components/appBar/customAppBarBuilder.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({CustomAppBarVM viewModel})
      : super(
          title: new Text(viewModel.currentRouteTitle),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            ),
          ],
        );
}
