import 'package:filters/bloc/event_bloc.dart';
import 'package:filters/model/event.dart';
import 'package:filters/model/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Container eventList(BuildContext context, EventBloc eventBloc) => Container(
      child: BlocBuilder(
        bloc: eventBloc,
        builder: (BuildContext context, EventWrapper eventWrapper) {
          if (eventWrapper.status == Status.initial && eventWrapper.eventList.isEmpty) {
            return Container(
                child: new Center(child: Text("No events for this day...")));
          } else if (eventWrapper.status == Status.loading) {
            return Container(
                child: new Center(child: new CircularProgressIndicator()));
          } else if (eventWrapper.status == Status.loaded || (eventWrapper.status == Status.initial && !eventWrapper.eventList.isEmpty)) {
            return ListView.builder(
              itemCount: eventWrapper.eventList.length,
              itemBuilder: (BuildContext context, int index) {
                var event = eventWrapper.eventList[index];
                return Card(
                  child: ListTile(
                    leading: Text(event.sId),
                    title: Text(event.title),
                    onTap: () {
                      print(event.title);
                    },
                  ),
                  elevation: 3,
                );
              },
            );
          } else {
            return Container(
                child: new Center(child: Text("else case")));
          }
        },
      ),
    );
