import 'package:bloc/bloc.dart';
import 'package:community/bloc/bloc.dart';
import 'package:community/graphql/queries.dart';
import 'package:community/vendor/globals.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  @override
  EventState get initialState => UnInitialisedEventState();

  @override
  Stream<EventState> mapEventToState(EventEvent event) async* {
    if (event is LoadNewEvents) {
      yield EventsLoadingState();

      try {
        QueryResult result =
            await graphQLClient.value.query(QueryOptions(document: Queries.getPosts));
        final List events = result.data['events']['data'];
        print(events);
        yield EventLoadedState(events: events);
      } catch (e) {
        print(e);
        yield UnInitialisedEventState();
      }
    }
  }
}

loadEvents() async {
  try {
    QueryResult result = await graphQLClient.value.query(QueryOptions(document: Queries.getPosts));
    final List events = result.data['events']['data'];
    print(events);
    return events;
  } catch (e) {
    print(e);
    throw e;
  }
}
