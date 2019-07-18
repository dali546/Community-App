import 'package:community/bloc/bloc.dart';
import 'package:community/view/components/appScaffold/custom_app_scaffold.dart';
import 'package:community/view/main/account_screen_view.dart';
import 'package:community/view/main/home_screen_view.dart';
import 'package:community/view/main/map_screen_view.dart';
import 'package:community/view/main/search_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mainScreenBloc = BlocProvider.of<MainScreenBloc>(context);
    return new AppScaffold(
      body: new BlocBuilder<MainScreenEvent, MainScreenState>(
        bloc: _mainScreenBloc,
        builder: (context, state) {
          if (state is HomeScreenState) {
            return HomeComponentView();
          } else if (state is SearchScreenState) {
            return SearchComponentView();
          } else if (state is MapScreenState) {
            return MapComponentView();
          } else if (state is AccountScreenState) {
            return AccountComponentView();
          } else {
            return Text("Failed to initialise App.");
          }
        },
      ),
    );
  }
}
