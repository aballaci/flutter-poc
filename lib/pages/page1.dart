import 'package:filters/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:filters/components/drawer.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      drawer: drawer(context),
      body: Center(
        child: Text('Page 1 example'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page2()),
          );
        },
      ),
    );
  }
}