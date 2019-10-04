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
    var todayTruncated = DateTime(today.year, today.month, today.day);
    var eventsToday = events.where((e) => e.start.isAtSameMomentAs(todayTruncated)).toList();
    return EventWrapper(status: Status.initial, eventList: eventsToday);
  }

  @override
  Stream<EventWrapper> mapEventToState(NavigateToDateEvent event) async* {
    var eventsToday = events.where((e) => e.start.isAtSameMomentAs(event.date)).toList();
    yield EventWrapper(status: Status.initial, eventList: eventsToday);
  }
}
