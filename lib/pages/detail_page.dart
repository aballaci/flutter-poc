import 'dart:math';

import 'package:filters/bloc/event_bloc.dart';
import 'package:filters/components/drawer.dart';
import 'package:filters/model/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {

  final Event event;
  final int index;



  DetailPage({@required this.event, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.organizer),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [ Hero(
          tag: event.sId,
          child: Image.network("https://picsum.photos/id/${1000 + index}/400/300"),
        ),
          Spacer(flex: 1 ,),
          Center(
            child: Text(event.title),
          )
        ]
      ),
    );
  }

}