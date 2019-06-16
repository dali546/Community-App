import 'package:equatable/equatable.dart';

abstract class MainScreenState extends Equatable {
  final String pageTitle;

  MainScreenState(this.pageTitle);
}

class HomeScreenState extends MainScreenState {
  HomeScreenState() : super("Community");
}

class SearchScreenState extends MainScreenState {
  SearchScreenState() : super("Search");
}

class MapScreenState extends MainScreenState {
  MapScreenState() : super("Live Map");
}

class AccountScreenState extends MainScreenState {
  AccountScreenState() : super("Account");
}
