import 'dart:collection';

import 'package:community/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomSmartRefresher extends StatefulWidget {
  @override
  _CustomSmartRefresherState createState() => _CustomSmartRefresherState();
}

class _CustomSmartRefresherState extends State<CustomSmartRefresher> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  EventBloc eventBloc;

  @override
  Widget build(BuildContext context) {
    eventBloc = BlocProvider.of<EventBloc>(context);
    return SmartRefresher(
      controller: refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      enablePullDown: true,
      enablePullUp: true,
      child: BlocBuilder(
        bloc: eventBloc,
        builder: (context, state) {
          if (state is EventsLoadingState) {
            return CircularProgressIndicator();
          } else if (state is EventLoadedState) {
            return Container(
              height: MediaQuery.of(context).size.height-100,
              child: ListView.builder(itemBuilder: (context, position) {
                return _buildItem(state.events[position]);
              }).build(context),
            );
          } else {
            return new Text("Failed to fetch data.");
          }
        },
      ),
    );
  }

  void _onRefresh() {
    eventBloc.dispatch(LoadNewEvents());
    refreshController.refreshCompleted();
  }

  void _onLoading() {
    eventBloc.dispatch(LoadNewEvents());
    refreshController.loadComplete();
  }

  Widget _buildItem(Map<String, dynamic> event) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Card(
          color: Colors.white10,
          child: new ListTile(
            title: Text(event['title']),
            trailing: Image.network(
              "https://i.imgur.com/WsUV4DK.gif",
              width: 64.0,
              fit: BoxFit.fitWidth,
            ),
            subtitle: Text(event['description']),
            isThreeLine: true,
          ),
          shape: StadiumBorder(),
        ));
  }

  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
