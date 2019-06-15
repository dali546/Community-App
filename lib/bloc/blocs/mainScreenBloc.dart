import 'package:bloc/bloc.dart';
import 'package:community/bloc/events/mainScreenEvent.dart';
import 'package:community/bloc/states/mainScreenState.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  @override
  get initialState => HomeScreenState();

  @override
  Stream<MainScreenState> mapEventToState(event) async* {
    if (event is UpdateMainScreenBodyEvent) {
      switch (event.body) {
        case MainPageScreen.HOME:
          yield HomeScreenState();
          break;
        case MainPageScreen.SEARCH:
          yield SearchScreenState();
          break;
        case MainPageScreen.LIVE:
          yield MapScreenState();
          break;
        case MainPageScreen.ACCOUNT:
          yield AccountScreenState();
          break;
      }
    }
  }
}
