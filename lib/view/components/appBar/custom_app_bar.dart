import 'package:community/bloc/blocs/main_screen_bloc.dart';
import 'package:community/bloc/states/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final _mainScreenBloc = BlocProvider.of<MainScreenBloc>(context);
    return AppBar(
      title: BlocBuilder(
          bloc: _mainScreenBloc,
          builder: (context, MainScreenState state) {
            return new Text(state.pageTitle);
          }),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
