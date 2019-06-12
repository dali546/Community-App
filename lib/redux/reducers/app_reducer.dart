import 'package:community/redux/actions/ui_actions.dart';
import 'package:community/redux/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState,ChangeApplicationNameAction>(_changeApplicationNameReducer)
]);


AppState _changeApplicationNameReducer(AppState state, ChangeApplicationNameAction action) {
  return state.copyWith(appName: action.appName);
}
