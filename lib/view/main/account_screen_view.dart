import 'package:community/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountComponentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          child: new Text("This will be the Account Page"),
        ),
        FlatButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).dispatch(AttemptLogoutEvent());
          },
          child: Text("Logout"),
        )
      ],
    );
  }
}
