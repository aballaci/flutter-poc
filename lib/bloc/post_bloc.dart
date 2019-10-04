import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:filters/events/post_event.dart';
import 'package:filters/model/post.dart';
import 'package:filters/services/post_service.dart';

class PostBloc extends Bloc<PostEvent, PostResponse> {
  @override
  PostResponse get initialState =>
      PostResponse(status: Status.initial, postList: new List(0));

  @override
  Stream<PostResponse> mapEventToState(PostEvent event) async* {
    switch (event) {
      case PostEvent.load:
        {
          yield PostResponse(status: Status.loading, postList: new List(0));
          print("loading");
          List<Post> posts = await fetchPosts();
          print("got result: " + posts.toString());
          yield PostResponse(status: Status.loaded, postList: posts);
        }
        break;
      case PostEvent.unload:
        {
          yield PostResponse(status: Status.initial, postList: new List(0));
        }
        break;
      case PostEvent.filterOdds:
        {
          yield PostResponse(status: Status.loading);
          List<Post> posts = await fetchPosts();
          yield PostResponse(
              status: Status.loaded,
              postList: posts.where((p) => p.id % 2 == 0).toList());
        }
        break;
    }
  }
}
