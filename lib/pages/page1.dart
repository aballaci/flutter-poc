import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:filters/bloc/event_bloc.dart';
import 'package:filters/components/event_list.dart';
import 'package:filters/model/navigate_to_date_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventBloc = BlocProvider.of<EventBloc>(context);
    return
      Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
//            floating: true,
//            snap: true,
              title: Text('Parties in Nürnberg'),
              backgroundColor: Colors.purple,
              brightness: Brightness.dark,
              expandedHeight: 230.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                    'assets/images/party.jpeg', fit: BoxFit.cover),
              ),
            ),
            EventList(),
          ],
        ),
        resizeToAvoidBottomPadding: true,

        bottomNavigationBar: DatePickerTimeline(
          DateTime.now(),
          height: 80.0,
          daysCount: 90,
          onDateChange: (date) {
            // New date selected
            print(date.toString());
            eventBloc.dispatch(NavigateToDateEvent(date: date));
          },
          selectionColor: Colors.lime.withAlpha(400),
          locale: 'de_DE',
        ),
      );
  }
}

