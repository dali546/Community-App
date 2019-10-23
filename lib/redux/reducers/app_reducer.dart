import 'package:community/redux/redux.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>(
  [
    TypedReducer<AppState, ChangeApplicationNameAction>(_changeApplicationNameReducer),
    TypedReducer<AppState, SaveUserDetailsAction>(_saveUserDetailsToStateReducer),
    TypedReducer<AppState, LogoutAction>(_removeUserFromStateReducer),
  ],
);

AppState _changeApplicationNameReducer(AppState state, ChangeApplicationNameAction action) {
  return state.copyWith(appName: action.appName);
}

AppState _saveUserDetailsToStateReducer(AppState state, SaveUserDetailsAction action) {
  return state.copyWith(authUser: action.authUser);
}

AppState _removeUserFromStateReducer(AppState state, LogoutAction action) {
  return state.copyWith(authUser: null);
}
