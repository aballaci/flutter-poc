import 'package:equatable/equatable.dart';
import 'package:filters/model/status.dart';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}



class PostResponse extends Equatable {
  List<Post> postList;
  Status status;

  PostResponse({this.status, this.postList});

  @override
  // TODO: implement props
  List<Object> get props => postList;

}