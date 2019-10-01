import 'package:filters/router.dart';
import 'package:flutter/material.dart';

void main() {
  FluroRouter.setupRouter();
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
        initialRoute: 'page1',
        // Use the generator provided by Fluro package
        onGenerateRoute: FluroRouter.router.generator
    );
  }
}
