import 'package:flutter/material.dart';

import '../../data/models/album_model.dart';

Widget buildColumm(TextEditingController? controller, Function()? onPressed) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
        child: TextField(
          // controller: _titleController,
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter your title',
          ),
        ),
      ),
      SizedBox(
        height: 46,
        width: 200,
        child: ElevatedButton(
          // onPressed: () {
          //   setState(() {
          //     _futureAlbum = createAlbum(_titleController.text);
          //   });
          // },
          onPressed: onPressed,
          child: const Text('Post'),
        ),
      ),
    ],
  );
}

Widget buildFutureBuilder(Future<Album>? _futureAlbum) {
  return FutureBuilder<Album>(
    future: _futureAlbum,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                snapshot.data!.title!,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('${snapshot.error}'),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
