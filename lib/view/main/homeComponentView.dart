import 'package:community/redux/actions/ui_actions.dart';
import 'package:community/redux/app_state.dart';
import 'package:community/view/components/appScaffold/appScaffold.dart';
import 'package:community/view/components/home/refresherList.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeComponentView extends StatefulWidget {
  @override
  _HomeComponentViewState createState() => _HomeComponentViewState();
}

class _HomeComponentViewState extends State<HomeComponentView> {
  final appNameTextController = new TextEditingController();
  final RefreshController _refreshController =
      new RefreshController(initialRefresh: false);

  _HomeComponentViewState();

  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of<AppState>(context);
    return AppScaffold(
        body: CustomSmartRefresher(
      refreshController: _refreshController,
    ));
  }
}
