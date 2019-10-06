import 'dart:math';

import 'package:filters/model/event.dart';
import 'package:filters/pages/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EventItem extends StatelessWidget {
  int index;
  Event event;

  int nextRandomId() {
    var random = Random();
    return random.nextInt(32);
  }

  EventItem(this.index, this.event);

  @override
  Widget build(BuildContext context) {
    final nextRandId = nextRandomId();
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.purple.withAlpha(30),
          onTap: () {
            print('Card tapped.');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(event: event, index: nextRandId),
                  ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Hero(
                  tag: event.sId,
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          "https://picsum.photos/id/${1000 + index}/400/160"),
                ),
              ),
              ListTile(
                leading: Text('21:00'),
                title: Text(event.title,
                    style: TextStyle(fontFamily: 'RobotoMono')),
                subtitle: Text(event.organizer),
              ),
            ],
          ),
        ),
      ),
    );
  }
}