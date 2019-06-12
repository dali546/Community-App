import 'action.dart';

class ChangeApplicationNameAction extends Action {
  final String appName;

  ChangeApplicationNameAction(this.appName);

  @override
  String getDescription() => 'AppName has been changed to "$appName"';
}
