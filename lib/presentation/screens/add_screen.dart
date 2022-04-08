import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/album_model.dart';
import 'package:flutter_rest_api/data/repository/album_repository.dart';
import 'package:flutter_rest_api/presentation/base/stateful_widget_base.dart';

class AddScreen extends StatefulWidgetBase {
  const AddScreen({Key? key, title = 'Add'}) : super(key: key, title: title);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _titleController = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title!,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('POST method'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: (_futureAlbum == null) ? buildColumm() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Widget buildColumm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
          child: TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: 'Enter your title',
            ),
          ),
        ),
        SizedBox(
          height: 46,
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _futureAlbum = createAlbum(_titleController.text);
              });
            },
            child: const Text('Post'),
          ),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder(
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
}
