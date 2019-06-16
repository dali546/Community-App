import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomSmartRefresher extends SmartRefresher {
  CustomSmartRefresher({
    RefreshController refreshController,
  }) : super(
            controller: refreshController,
            child: ListView(
              children: <Widget>[
                _buildRow(1),
                _buildRow(2),
                _buildRow(3),
                _buildRow(4),
              ],
            ));
}

Widget _buildRow(int position) {
  return Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Card(
        color: Colors.white10,
        child: new ListTile(
          title: Text("Example Event Title $position"),
          trailing: Image.network(
            "https://i.imgur.com/WsUV4DK.gif",
            width: 64.0,
            fit: BoxFit.fitWidth,
          ),
          subtitle: Text("Get Rickrolled by this event happening near you."),
          isThreeLine: true,
        ),
        shape: StadiumBorder(),
      ));
}
