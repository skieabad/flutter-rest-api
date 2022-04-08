import 'package:flutter/material.dart';
import 'package:flutter_rest_api/presentation/screens/get_screen.dart';
import 'package:flutter_rest_api/presentation/screens/main_screen.dart';
import 'package:flutter_rest_api/presentation/screens/patch_screen.dart';
import '../presentation/screens/delete_screen.dart';
import 'presentation/screens/add_screen.dart';
import '../presentation/screens/update_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // use named routes
      routes: {
        '/': (context) => const MainScreen(),
        '/add': (context) => const AddScreen(),
        '/update': (context) => const UpdateScreen(),
        '/delete': (context) => const DeleteScreen(),
        '/patch': (context) => const PatchScreen(),
        '/get': (context) => const GetScreen(),
      },
    ),
  );
}
