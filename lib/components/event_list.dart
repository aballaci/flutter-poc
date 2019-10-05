import 'package:filters/bloc/event_bloc.dart';
import 'package:filters/model/event.dart';
import 'package:filters/model/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventBloc = BlocProvider.of<EventBloc>(context);
    return Container(
      child: BlocBuilder(
        bloc: eventBloc,
        builder: (BuildContext context, EventWrapper eventWrapper) {
          if (eventWrapper.status == Status.initial &&
              eventWrapper.eventList.isEmpty) {
            return Container(
                child: new Center(
                    child: Text("Es gibt keine Evente für den Tag...")));
          } else if (eventWrapper.status == Status.loading) {
            return Container(
                child: new Center(child: new CircularProgressIndicator()));
          } else if (eventWrapper.status == Status.loaded ||
              (eventWrapper.status == Status.initial &&
                  !eventWrapper.eventList.isEmpty)) {
            return ListView.builder(
              itemCount: eventWrapper.eventList.length,
              itemBuilder: (BuildContext context, int index) {
                var event = eventWrapper.eventList[index];
                return Container(
                  width: 200,
                  child: Card(
                    color: Colors.black26,
                    elevation: 0,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.panorama, size: 50),
                            title: Text(event.title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            subtitle: Text(event.organizer,
                                style: TextStyle(color: Colors.blue)),
                            onTap: () {
                              print(event.title);
                            },
                          ),
                          ButtonTheme.bar(
                            child: ButtonBar(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                                Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: Colors.redAccent,
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                );
              },
            );
          } else {
            return Container(child: new Center(child: Text("else case")));
          }
        },
      ),
    );
    ;
  }
}
