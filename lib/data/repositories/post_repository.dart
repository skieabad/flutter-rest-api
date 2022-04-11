import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_rest_api/data/models/post_model.dart';
import 'package:http/http.dart' as http;

// A function that converts response body into a List<Album>
List<Posts> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed.map<Posts>((json) => Posts.fromJson(json)).toList();
}

// GET http method
Future<List<Posts>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  // use the compute function to run parsePosts in a separate isolate
  return compute(parsePosts, response.body);
}
