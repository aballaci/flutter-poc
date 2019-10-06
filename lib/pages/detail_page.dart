import 'package:date_format/date_format.dart';
import 'package:lipsum/lipsum.dart';
import 'package:filters/model/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Event event;
  final int index;
  static const double _hPad = 16.0;

  DetailPage({@required this.event, @required this.index});

  @override
  Widget build(BuildContext context) {
    print("called with id: "  + this.index.toString());
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(event.organizer),
//        backgroundColor: Color(0xFFcb3066),
      ),
      body: Container(
//        decoration: BoxDecoration(
//            gradient: LinearGradient(
//                colors: [
//                  Color(0xFFcb3066),
//                  Color(0xFFFF5F6D),
//                ],
//                begin: Alignment.bottomCenter,
//                end: Alignment.topCenter,
//                tileMode: TileMode.clamp)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Hero(
                  tag: event.sId,
                  child: Container(
                    child: Image.network("https://picsum.photos/id/${1000 + index}/400/300"),
                  ))
              ),
              Container(
                padding: EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, 10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("0 7", style: Theme.of(context).textTheme.display1),
                          Text("OKT", style: Theme.of(context).textTheme.display2),
                          Text("21:00"),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(event.organizer, style: Theme.of(context).textTheme.title,),
                            Text(event.title, style: Theme.of(context).textTheme.body2,),
                            Text(createParagraph(numParagraphs: 3, numSentences: 2), style: Theme.of(context).textTheme.body1,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
