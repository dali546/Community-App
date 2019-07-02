import 'dart:collection';

import 'package:equatable/equatable.dart';

abstract class EventState extends Equatable {}

class UnInitialisedEventState extends EventState {}

class EventsLoadingState extends EventState {}

class EventLoadedState extends EventState {
  List events;
  EventLoadedState({this.events});
}

class EventsRefreshingState extends EventState {}
