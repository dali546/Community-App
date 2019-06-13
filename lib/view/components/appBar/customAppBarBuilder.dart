import 'package:community/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:community/view/components/appBar/customAppBar.dart';

class CustomAppBarBuilder extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CustomAppBarVM>(
      converter: CustomAppBarVM.fromStore,
      builder: (context, viewModel) {
        return new CustomAppBar(viewModel: viewModel);
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

// ViewModel will be required in BLoC pattern
class CustomAppBarVM {
  String appName;
  String currentRouteTitle;

  CustomAppBarVM(this.currentRouteTitle);

  static CustomAppBarVM fromStore(Store<AppState> store) {
    return CustomAppBarVM(store.state.currentRouteTitle);
  }
}
