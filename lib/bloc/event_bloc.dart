import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:filters/model/event.dart';
import 'package:filters/model/events_dump.dart';
import 'package:filters/model/navigate_to_date_event.dart';
import 'package:filters/model/status.dart';

class EventBloc extends Bloc<NavigateToDateEvent, EventWrapper> {
  List<Event> events = eventsJson.map((i) => Event.fromJson(i)).toList();

  @override
  EventWrapper get initialState {
    var today = new DateTime.now();
    var thisDay = DateTime(today.year, today.month, today.day);
    print("today" + today.toString());
    print("thisday: " + thisDay.toString());
    var eventsToday = events.where((e) {
      print("Event start:" +
          e.start.toString() +
          "   this day:" +
          thisDay.toString());
      return e.start.compareTo(thisDay) == 0;
    }).toList();
    return EventWrapper(status: Status.initial, eventList: eventsToday);
  }

  @override
  Stream<EventWrapper> mapEventToState(NavigateToDateEvent event) async* {
    var eventsToday = events.where((e) {
      return e.start.compareTo(event.date) == 0;
    }).toList();
    yield EventWrapper(status: Status.initial, eventList: eventsToday);
  }
}
