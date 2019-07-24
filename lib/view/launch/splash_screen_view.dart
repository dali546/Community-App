import 'package:community/bloc/blocs/splash_bloc.dart';
import 'package:community/bloc/events/splash_event.dart';
import 'package:community/bloc/states/splash_state.dart';
import 'package:community/vendor/globals.dart';
import 'package:community/vendor/routes.dart';
import 'package:community/view/components/animated_background.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _splashBloc = BlocProvider.of<SplashBloc>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedBackground(),
          Column(children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Image.asset("assets/images/logo.png",
                    fit: BoxFit.fitWidth)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(store.state.appName,
                    style: Theme.of(context).textTheme.headline)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CircularProgressIndicator()),
            BlocListener<SplashBloc, SplashState>(
              listener: (context, state) {
                if (state is InitialSplashState) {
                  // Add delay just because it's too fast.
                  Future.delayed(Duration(seconds: 5)).then(
                      (_) => _splashBloc.dispatch(CheckIfTokenPresentEvent()));
                } else if (state is UnknownUserCredentialsState ||
                    state is FailedAuthenticationState) {
                  router.navigateTo(context, Routes.auth,
                      replace: true, transition: TransitionType.nativeModal);
                } else if (state is SuccessfulAuthenticationState) {
                  router.navigateTo(context, Routes.home,
                      replace: true, transition: TransitionType.inFromBottom);
                }
              },
              child: BlocBuilder(
                  bloc: _splashBloc,
                  builder: (BuildContext context, SplashState state) {
                    print(state);
                    if (state is InitialSplashState) {
                      return Text("App is Initialising...");
                    } else if (state is GettingUserCredentialsState) {
                      return Text("Loading settings");
                    } else if (state is UnknownUserCredentialsState) {
                      return Text("Taking you to log in...");
                    } else if (state is AuthenticatingUserState) {
                      return Text("Authenticating...");
                    } else if (state is FailedAuthenticationState) {
                      return Text(
                          "Failed to Authenticate. Please log in again...");
                    } else if (state is SuccessfulAuthenticationState) {
                      return Text("Successfully logged in. Welcome");
                    } else
                      return Text("Unknown error.");
                  }),
            ),
          ]),
        ],
      ),
    );
  }
}
