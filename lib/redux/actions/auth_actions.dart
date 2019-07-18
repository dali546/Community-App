import 'package:community/models/AuthUser.dart';
import 'package:community/redux/redux.dart';

class SaveUserDetailsAction extends Action {
  AuthUser authUser;

  SaveUserDetailsAction({json}) : this.authUser = AuthUser.fromJson(json);

  @override
  String getDescription() {
    return "Saving User details...";
  }
}
