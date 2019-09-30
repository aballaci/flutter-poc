import 'package:flutter/material.dart';

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
          color: Colors.greenAccent,
        ),
      ),
      ListTile(
        title: Text('Page 1'),
        onTap: () {
          Navigator.pushReplacementNamed(context, 'page1');
        },
      ),
      ListTile(
        title: Text('Page 2'),
        onTap: () {
          Navigator.pushReplacementNamed(context, 'page2/panky');
        },
      ),
    ],
  ),
);