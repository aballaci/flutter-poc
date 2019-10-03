import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:filters/events/post_event.dart';
import 'package:filters/model/post.dart';
import 'package:filters/services/http.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, List<Post>> {


  @override
  List<Post> get initialState => new List<Post>(0);

  @override
  Stream<List<Post>> mapEventToState(PostEvent event) async* {
    switch (event) {
      case PostEvent.load:
        List<Post> posts = await fetchPosts();
        yield posts;
        break;
      case PostEvent.unload:
        yield new List(0);
        break;
        case PostEvent.filterOdds:
          List<Post> posts = await fetchPosts();
        yield posts.where((p) =>  p.id % 2  == 0).toList();
        break;
    }
  }
}
