import 'package:community/bloc/blocs/event_bloc.dart';
import 'package:community/view/components/home/refresher_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeComponentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => EventBloc(),
      child: CustomSmartRefresher(),
    );
  }
}
