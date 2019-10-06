import 'package:filters/bloc/event_bloc.dart';
import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/pages/page1.dart';
import 'package:filters/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Armand Ballaci"),
            accountEmail: Text("aballaci@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text('Calendar Events'),
            leading: Icon(Icons.calendar_today),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          builder: (context) => EventBloc(),
                          child: Page1(),
                        )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Posts'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          builder: (context) => PostBloc(),
                          child: Page2(),
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
