import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/components/drawer.dart';
import 'package:filters/components/postlist.dart';
import 'package:filters/events/post_event.dart';
import 'package:filters/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc'),
      ),
      drawer: drawer(context),
      body: BlocBuilder<PostBloc, PostResponse>(
        builder: (context, posts) {
          return PostList(context, postBloc);
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              heroTag: "btn_add",
              onPressed: () {
                postBloc.dispatch(PostEvent.load);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              heroTag: "btn_remove",
              onPressed: () {
                postBloc.dispatch(PostEvent.unload);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.filter_list),
              heroTag: "btn_filter",
              onPressed: () {
                postBloc.dispatch(PostEvent.filterOdds);
              },
            ),
          ),
        ],
      ),
    );
  }
}