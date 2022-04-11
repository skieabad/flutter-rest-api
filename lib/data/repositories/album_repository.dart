import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';

// ! POST http method
Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}

// ! GET http method
Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return Album.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('Failed to load album');
  }
}

// ! GET http method
Future<Album> fetchPost() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return Album.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('Failed to load posts');
  }
}

// ! PUT http method
Future<Album> updateAlbum(String title) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}

// ! PUT http method
Future<Album> updatePost(String title, String body) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'body': body,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}

// ! DELETE http method
Future<Album> deleteAlbum(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, int>{
      'id': id,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}

// ! DELETE http method
Future<Album> deletePost(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, int>{
      'id': id,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album');
  }
}

// ! PATCH http method
Future<Album> patchAlbum(String body) async {
  final response = await http.patch(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'body': body,
    }),
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to patch post');
  }
}
