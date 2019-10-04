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
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: new Container(
          margin: const EdgeInsets.only(top: 25.0),
          child: new Column(children: [
            DatePickerTimeline(
              DateTime.now(),

              onDateChange: (date) {
                // New date selected
                print(date.toString());
                eventBloc.dispatch(NavigateToDateEvent(date: date));
              },
              selectionColor: Colors.blue,
              locale: 'de_DE',
            ),
            Expanded(
              child: eventList(context, eventBloc),
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      builder: (context) => PostBloc(),
                      child: Page2(),
                    )),
          );
        },
      ),
    );
  }
}
