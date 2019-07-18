import 'package:community/bloc/blocs/auth_bloc.dart';
import 'package:community/bloc/events/auth_event.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class AuthScreen extends StatelessWidget {
  static final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  static final GlobalKey<FormBuilderState> _registerFormKey = GlobalKey<FormBuilderState>();
  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.network(
            "https://cdn141.picsart.com/252986329011202.jpg?r1024x1024",
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    flex: 3, child: Text("Welcome", style: Theme.of(context).textTheme.headline)),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: FlipCard(
                      key: cardKey,
                      flipOnTouch: false,
                      front: _buildRegisterCard(context, authBloc),
                      back: _buildLoginCard(context),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: RichText(
                      text: TextSpan(children: [
                        WidgetSpan(child: Text("Already Have an account? ")),
                        WidgetSpan(
                          child: InkWell(
                            child: Text(
                              "Login",
                              style: TextStyle(decoration: TextDecoration.underline),
                            ),
                            onTap: () {
                              cardKey.currentState.toggleCard();
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card _buildLoginCard(BuildContext context) {
    return Card(
      elevation: 10,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Login", style: Theme.of(context).textTheme.title),
            TextFormField(),
            GradientButton(
              gradient: LinearGradient(colors: <Color>[
                Colors.blue.shade900,
                Colors.blue.shade700,
                Colors.blue.shade400,
              ]),
              child: Text("Login"),
              callback: () {
                if (_loginFormKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Logging you in")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Card _buildRegisterCard(BuildContext context, AuthBloc authBloc) {
    return Card(
      elevation: 10,
      child: SingleChildScrollView(child: _buildRegisterForm(context, authBloc)),
    );
  }

  _buildRegisterForm(BuildContext context, AuthBloc authBloc) {
    return Column(
      children: <Widget>[
        FormBuilder(
          key: _registerFormKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                attribute: "username",
                decoration: InputDecoration(labelText: "Username"),
                validators: [
                  FormBuilderValidators.required(),
//                  FormBuilderValidators.minLength(8),
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
//                  FormBuilderValidators.minLength(8),
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
              authBloc.dispatch(AttemptLoginEvent(value: _registerFormKey.currentState.value));
            }
          },
        ),
      ],
    );
  }
}
