import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/photos_model.dart';

// A function that converts response body into a List<Album>
List<Photos> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed.map<Photos>((json) => Photos.fromJson(json)).toList();
}

// GET http method
Future<List<Photos>> fetchPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  // use the compute function to run parsePhotos in a separate isolate
  return compute(parsePhotos, response.body);
}



