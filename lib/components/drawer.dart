import 'package:filters/bloc/event_bloc.dart';
import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/pages/page1.dart';
import 'package:filters/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Drawer drawer(BuildContext context) => Drawer(
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Text('Drawer Header'),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Page 1'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BlocProvider(
              builder: (context) => EventBloc(),
              child: Page1(),
            )),
          );
        },
      ),
      ListTile(
        title: Text('Page 2'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BlocProvider(
              builder: (context) => PostBloc(),
              child: Page2(),
            )),
          );
        },
      ),
    ],
  ),
);