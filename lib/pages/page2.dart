import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/components/drawer.dart';
import 'package:filters/components/postlist.dart';
import 'package:filters/events/post_event.dart';
import 'package:filters/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Page2 extends StatelessWidget {
  final String username;

  Page2({this.username});

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      drawer: drawer(context),
      body: BlocBuilder<PostBloc, List<Post>>(
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
              onPressed: () {
                postBloc.dispatch(PostEvent.load);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                postBloc.dispatch(PostEvent.unload);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.filter_list),
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