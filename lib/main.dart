import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_pattern_bloc/bloc/listr_user_cubit.dart';
import 'package:users_pattern_bloc/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  BlocProvider(
        create: (BuildContext context) => ListUserCubit(),
        child:  HomePage(),
      ),
    );
  }
}
