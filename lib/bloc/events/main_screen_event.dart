import 'package:equatable/equatable.dart';

abstract class MainScreenEvent extends Equatable {}

class UpdateMainScreenBodyEvent extends MainScreenEvent {
  final MainPageScreen body;

  UpdateMainScreenBodyEvent(this.body);
}

enum MainPageScreen { HOME, SEARCH, LIVE, ACCOUNT }
