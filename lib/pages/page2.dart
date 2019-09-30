import 'package:filters/components/postlist.dart';
import 'package:flutter/material.dart';
import 'package:filters/components/drawer.dart';
class Page2 extends StatelessWidget {
  final String username;

  Page2({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      drawer: drawer(context),
      body: PostList(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings_backup_restore),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'page1');
        },
      ),
    );
  }
}