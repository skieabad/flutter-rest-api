import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/album_model.dart';
import 'package:flutter_rest_api/data/repository/album_repository.dart';
import 'package:flutter_rest_api/presentation/base/stateful_widget_base.dart';

import '../widgets/add_screen_widgets.dart';

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
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('POST method'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: (_futureAlbum == null)
              ? buildColumm(
                  _titleController,
                  () {
                    setState(
                      () {
                        _futureAlbum = createAlbum(_titleController.text);
                      },
                    );
                  },
                )
              : buildFutureBuilder(_futureAlbum),
        ),
      ),
    );
  }
}
