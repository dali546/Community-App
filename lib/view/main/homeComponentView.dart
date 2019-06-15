import 'package:community/view/components/home/refresherList.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeComponentView extends StatelessWidget {
  final RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return CustomSmartRefresher(
      refreshController: _refreshController,
    );
  }
}
