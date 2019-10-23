import 'package:community/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class AuthRegisterForm extends StatelessWidget {
  static final GlobalKey<FormBuilderState> _registerFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _registerFormKey,
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
                attribute: "email",
                decoration: InputDecoration(labelText: "Email"),
                validators: [FormBuilderValidators.email(), FormBuilderValidators.required()],
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
              FormBuilderTextField(
                attribute: "password_confirmation",
                decoration: InputDecoration(labelText: "Confirm Password"),
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(4),
                  (val) {
                    if (_registerFormKey.currentState.fields['password'].currentState.value != val) {
                      return "Passwords Do Not Match";
                    } else {
                      return null;
                    }
                  }
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
          child: Text("Register"),
          callback: () {
            _registerFormKey.currentState.save();
            if (_registerFormKey.currentState.validate()) {
              print("Registering");
              authBloc.dispatch(AttemptRegisterEvent(value: _registerFormKey.currentState.value));
            }
          },
        ),
      ],
    );
  }
}
