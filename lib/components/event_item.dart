import 'dart:math';

import 'package:filters/model/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class EventItem extends StatelessWidget {
  int index;
  Event event;

  int nextRandomId(){
    var random = Random();
    return random.nextInt(32);
  }

  EventItem(this.index, this.event);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: FadeInImage.memoryNetwork(placeholder: kTransparentImage,
                  image: "https://picsum.photos/id/${1000 + nextRandomId()}/400/160"),
            ),
            ListTile(
              leading: Text('21:00'),
              title: Text(event.title, style: TextStyle(fontFamily: 'RobotoMono')),
              subtitle: Text(event.organizer),
            ),
          ],
        ),
      ),
    );
  }
}
