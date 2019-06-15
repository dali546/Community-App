import 'package:community/bloc/blocs/mainScreenBloc.dart';
import 'package:community/bloc/events/mainScreenEvent.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      onTap: (index) {
        switch (index) {
          case 0:
            BlocProvider.of<MainScreenBloc>(context)
                .dispatch(UpdateMainScreenBodyEvent(MainPageScreen.HOME));
            break;
          case 1:
            BlocProvider.of<MainScreenBloc>(context)
                .dispatch(UpdateMainScreenBodyEvent(MainPageScreen.SEARCH));
            break;
          case 2:
            BlocProvider.of<MainScreenBloc>(context)
                .dispatch(UpdateMainScreenBodyEvent(MainPageScreen.LIVE));
            break;
          case 3:
            BlocProvider.of<MainScreenBloc>(context)
                .dispatch(UpdateMainScreenBodyEvent(MainPageScreen.ACCOUNT));
            break;
        }
      },
      items: <Widget>[
        InkWell(child: Icon(Icons.home)),
        InkWell(child: Icon(Icons.search)),
        InkWell(child: Icon(Icons.pin_drop)),
        InkWell(child: Icon(Icons.account_circle)),
      ],
    );
  }
}
