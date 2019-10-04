import 'package:equatable/equatable.dart';
import 'package:filters/model/status.dart';
import 'package:intl/intl.dart';

class Event {
  String sId;
  int index;
  String organizer;
  String title;
  DateTime start;

  Event({this.sId, this.index, this.organizer, this.title, this.start});

  Event.fromJson(Map<String, dynamic> json) {
    DateFormat format = new DateFormat("yyyy/MM/dd");
    sId = json['_id'];
    index = json['index'];
    organizer = json['organizer'];
    title = json['title'];
    start = format.parse(json['start']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['index'] = this.index;
    data['organizer'] = this.organizer;
    data['title'] = this.title;
    data['start'] = this.start;
    return data;
  }
}

class EventWrapper extends Equatable {
  List<Event> eventList;
  Status status;

  EventWrapper({this.status, this.eventList});

  @override
  // TODO: implement props
  List<Object> get props => eventList;

}