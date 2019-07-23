import 'package:bloc/bloc.dart';
import 'package:community/bloc/bloc.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  @override
  AuthScreenState get initialState => LoginAuthScreenState();

  @override
  Stream<AuthScreenState> mapEventToState(AuthScreenEvent event) async* {
    print(event);
    if (event is FlipCardEvent) {
      if (currentState is LoginAuthScreenState)
        yield RegisterAuthScreenState();
      else
        yield LoginAuthScreenState();
    }
  }
}