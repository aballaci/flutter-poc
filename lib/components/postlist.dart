import 'package:filters/model/post.dart';
import 'package:filters/services/http.dart';
import 'package:flutter/material.dart';

Container PostList(BuildContext context) => Container(
      child: FutureBuilder(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          var posts = snapshot.data;
          if (snapshot.data == null) {
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
