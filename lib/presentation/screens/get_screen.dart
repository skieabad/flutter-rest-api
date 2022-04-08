import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/photos_model.dart';
import 'package:flutter_rest_api/data/repository/photos_repository.dart';

import '../widgets/get_screen_widgets.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({Key? key}) : super(key: key);

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET method'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 28, 123, 130),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Photos>>(
            future: fetchPhotos(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('an error has occured'),
                );
              } else if (snapshot.hasData) {
                return getScreenWidgets(snapshot.data);
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 28, 123, 130),
                  ),
                );
              }
            }),
      ),
    );
  }
}
