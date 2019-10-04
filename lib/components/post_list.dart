import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/model/post.dart';
import 'package:filters/model/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Container PostList(BuildContext context, PostBloc postBloc) => Container(
      child: BlocBuilder(
        bloc: postBloc,
        builder: (BuildContext context, PostResponse postResponse) {
          if (postResponse.status == Status.initial) {
            return Container(
                child: new Center(child: Text("press button to load posts")));
          } else if (postResponse.status == Status.loading) {
            return Container(
                child: new Center(child: new CircularProgressIndicator()));
          } else if (postResponse.status == Status.loaded) {
            return ListView.builder(
              itemCount: postResponse.postList.length,
              itemBuilder: (BuildContext context, int index) {
                var post = postResponse.postList[index];
                return Card(
                  child: ListTile(
                    leading: Text(post.id.toString()),
                    title: Text(post.title),
                    onTap: () {
                      print(post.title);
                    },
                  ),
                  elevation: 3,
                );
              },
            );
          } else {
            return Container(
                child: new Center(child: Text("else case")));
          }
        },
      ),
    );
