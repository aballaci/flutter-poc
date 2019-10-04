import 'dart:async';
import 'dart:convert';
import 'package:filters/model/event.dart';
import 'package:filters/model/post.dart';
import 'package:http/http.dart' as http;

Future<List<Event>> fetchEvents() async {
  final response = await http.get('http://localhost:1111');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    List<dynamic> parsedJson = json.decode(response.body);
    return parsedJson.map((i) => Event.fromJson(i)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load events');
  }
}