import 'package:community/bloc/bloc.dart';
import 'package:community/bloc/blocs/auth_bloc.dart';
import 'package:community/vendor/globals.dart';
import 'package:community/vendor/routes.dart';
import 'package:community/view/auth/auth_login_form.dart';
import 'package:community/view/auth/auth_register_form.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  static final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    final authScreenBloc = BlocProvider.of<AuthScreenBloc>(context);    
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Image.network("https://cdn141.picsart.com/252986329011202.jpg?r1024x1024",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Expanded(flex: 2, child: Text("Welcome", style: Theme.of(context).textTheme.headline)),
            Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: FlipCard(
                        onFlip: () => authScreenBloc.dispatch(FlipCardEvent()),
                        key: cardKey,
                        flipOnTouch: false,
                        front: Card(
                            elevation: 10,
                            child: SingleChildScrollView(child: AuthLoginForm())),
                        back: Card(
                            elevation: 10,
                            child: SingleChildScrollView(child: AuthRegisterForm()))))),
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: BlocBuilder(
                        bloc: authScreenBloc,
                        builder: (BuildContext context, AuthScreenState state) {
                          print(state);
                          if (state is LoginAuthScreenState) {
                            return RichText(
                                text: TextSpan(children: [
                              WidgetSpan(child: Text("Don't have an account. ")),
                              WidgetSpan(
                                  child: InkWell(
                                      child: Text("Register",
                                          style: TextStyle(decoration: TextDecoration.underline)),
                                      onTap: () => cardKey.currentState.toggleCard()))
                            ]));
                          } else {
                            return RichText(
                                text: TextSpan(children: [
                              WidgetSpan(child: Text("Already Have an account? ")),
                              WidgetSpan(
                                  child: InkWell(
                                      child: Text("Login",
                                          style: TextStyle(decoration: TextDecoration.underline)),
                                      onTap: () => cardKey.currentState.toggleCard()))
                            ]));
                          }
                        })))
          ]),
          BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                print(state);
                if (state is FailedAuthenticationState) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Failed!"),
                      content: Text("Failed to authenticate"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Ok"),
                          onPressed: () {
                            router.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                } else if (state is SuccessfulAuthenticationState) {
                  router.navigateTo(context, Routes.home);
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    print(state);
                    if (state is UnauthenticatedUserState) {
                      return Container();
                    } else if (state is AuthenticatingUserState) {
                      return CircularProgressIndicator();
                    } else if (state is FailedAuthenticationState) {
                      print("State failed");
                      return Container();
                    } else {
                      return Container();
                    }
                  }))
        ]));
  }
}
