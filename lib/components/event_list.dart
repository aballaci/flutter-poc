import 'dart:math';

import 'package:filters/bloc/event_bloc.dart';
import 'package:filters/components/event_item.dart';
import 'package:filters/model/event.dart';
import 'package:filters/model/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventList extends StatelessWidget {

  int nextRandomId() {
    var random = Random();
    return random.nextInt(32);
  }
  @override
  Widget build(BuildContext context) {
    final eventBloc = BlocProvider.of<EventBloc>(context);
    return BlocBuilder(
      bloc: eventBloc,
      builder: (BuildContext context, EventWrapper eventWrapper) {
          return SliverFixedExtentList(
            itemExtent: 240.0,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var event = eventWrapper.eventList[index];
                return EventItem(index, event);
              },
              childCount: eventWrapper.eventList.length,
            ),
          );
      },
    );
  }
}
