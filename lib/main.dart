import 'package:bloc/bloc.dart';
import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/bloc/simple_bloc_delegate.dart';
import 'package:filters/pages/page2.dart';
import 'package:filters/styles.dart';
import 'package:flutter/material.dart';
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
        home: BlocProvider(
          builder: (context) => PostBloc(),
          child: Page2(),
        ),
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(title: AppBarTextStyle),
            ),
            textTheme: TextTheme(
              title: TitleTextStyle,
              body1: Body1TextStyle,
              display1: AttentionTextStyle,
              display2: WideTextStyle,
            ))
        // Initial Page set to Login Page
        );
  }
}
