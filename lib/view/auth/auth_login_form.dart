import 'package:community/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class AuthLoginForm extends StatelessWidget {
  static final GlobalKey<FormBuilderState> _loginFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _loginFormKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                attribute: "username",
                decoration: InputDecoration(labelText: "Username"),
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(4),
                ],
              ),
              FormBuilderTextField(
                attribute: "password",
                decoration: InputDecoration(labelText: "Password"),
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(4),
                ],
                obscureText: true,
              ),
            ],
          ),
        ),
        GradientButton(
          gradient: LinearGradient(colors: <Color>[
            Colors.blue.shade900,
            Colors.blue.shade700,
            Colors.blue.shade400,
          ]),
          child: Text("Login"),
          callback: () {
            _loginFormKey.currentState.save();
            if (_loginFormKey.currentState.validate()) {
              print("Logging in");
              authBloc.dispatch(AttemptLoginEvent(value: _loginFormKey.currentState.value));
            }
          },
        ),
      ],
    );
  }
}
