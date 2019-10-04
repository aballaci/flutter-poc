import 'dart:async';
import 'dart:convert';
import 'package:filters/model/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPosts() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    List<dynamic> parsedJson = json.decode(response.body);
    return parsedJson.map((i) => Post.fromJson(i)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load posts');
  }
}