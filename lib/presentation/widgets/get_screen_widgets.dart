import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';

// Widget getScreenWidgets(List<Photos>? fetchAlbum) {
//   return GridView.builder(
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       crossAxisSpacing: 20,
//       mainAxisSpacing: 10,
//     ),
//     padding: const EdgeInsets.all(18),
//     itemCount: fetchAlbum!.length,
//     itemBuilder: (contex, index) {
//       return Image.network(fetchAlbum[index].url!);
//     },
//   );
// }

Widget getScreenWidgets(List<Posts>? fetchPosts) {
  return Padding(
    padding: const EdgeInsets.only(top: 22),
    child: ListView.builder(
      itemCount: fetchPosts!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 100.0),
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  title: Text(
                    fetchPosts[index].title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    fetchPosts[index].body!,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
