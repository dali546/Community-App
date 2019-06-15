import 'package:community/bloc/blocs/mainScreenBloc.dart';
import 'package:community/bloc/events/mainScreenEvent.dart';
import 'package:community/bloc/states/mainScreenState.dart';
import 'package:community/view/components/appScaffold/appScaffold.dart';
import 'package:community/view/main/accountComponentView.dart';
import 'package:community/view/main/homeComponentView.dart';
import 'package:community/view/main/mapComponentView.dart';
import 'package:community/view/main/searchComponentView.dart';
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
          }
        },
      ),
    );
  }
}
