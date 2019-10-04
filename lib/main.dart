import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/bloc/simple_bloc_delegate.dart';
import 'package:filters/pages/page2.dart';
import 'package:filters/router.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        // Initial Page set to Login Page
      home: BlocProvider(
        builder: (context) => PostBloc(),
        child: Page2(),
      ),
    );
  }
}
