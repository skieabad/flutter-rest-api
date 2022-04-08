import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/photos_model.dart';

Widget getScreenWidgets(List<Photos>? fetchAlbum) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
    ),
    padding: const EdgeInsets.all(18),
    itemCount: fetchAlbum!.length,
    itemBuilder: (contex, index) {
      return Image.network(fetchAlbum[index].url!);
    },
  );
}
