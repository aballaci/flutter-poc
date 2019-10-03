import 'package:filters/bloc/post_bloc.dart';
import 'package:filters/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Container PostList(BuildContext context, PostBloc postBloc) => Container(
      child: BlocBuilder(
        bloc: postBloc,
        builder: (BuildContext context, List<Post> posts) {
          if (posts == null || posts.isEmpty) {
            return Container(child: new Center(child: new CircularProgressIndicator()));
          } else {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                var post = posts[index];
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
          }
        },
      ),
    );
