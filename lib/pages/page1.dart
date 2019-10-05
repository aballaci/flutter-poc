import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:filters/bloc/event_bloc.dart';
import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/components/event_list.dart';
import 'package:filters/model/navigate_to_date_event.dart';
import 'package:filters/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventBloc = BlocProvider.of<EventBloc>(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('SliverAppBar'),
          backgroundColor: Colors.blue,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('assets/party.jpeg', fit: BoxFit.cover),
          ),

        ),

        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
              Container(color: Colors.pink),
            ],
          ),
        ),
      ],
    );
  }
}
