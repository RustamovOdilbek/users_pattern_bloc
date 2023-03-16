import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_pattern_bloc/bloc/list_user_state.dart';
import 'package:users_pattern_bloc/bloc/listr_user_cubit.dart';
import 'package:users_pattern_bloc/service/log_service.dart';

import '../model/user_model.dart';
import '../views/view_of_home.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> items = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListUserCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Users"),
        ),
      ),
      body: BlocBuilder<ListUserCubit, ListUserState>(
        builder: (BuildContext context, ListUserState state) {
          if (state is ListUserError) {}

          if (state is ListUserLoading) {
            return viewOfHome(items, true);
          }
          if (state is ListUserLoaded) {
            LogService.e(state.users.toString());
            items = state.users!;
            if(items != null){
              viewOfHome(items, false);
            }
          }

          return viewOfHome(items, false);
        },
      ),
    );
  }
}
