import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/album_model.dart';
import 'package:flutter_rest_api/presentation/base/stateful_widget_base.dart';

import '../../data/repositories/album_repository.dart';

class UpdateScreen extends StatefulWidgetBase {
  const UpdateScreen({Key? key, title = 'Update'})
      : super(key: key, title: title);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  late Future<Album>? _futureAlbum;

  @override
  void initState() {
    super.initState();
    // _futureAlbum = fetchAlbum();
    _futureAlbum = fetchPost();
  }

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
          title: const Text('PUT method'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: buildFutureBuilder(),
        ),
      ),
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        title: Text(
                          snapshot.data!.title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data!.body!,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                    child: TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: 'Update your title',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                    child: TextField(
                      controller: _bodyController,
                      decoration: const InputDecoration(
                        hintText: 'Update your body',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 46,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureAlbum = updatePost(
                              _titleController.text, _bodyController.text);
                          _titleController.clear();
                          _bodyController.clear();
                        });
                      },
                      child: const Text('Update data'),
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      },
    );
  }
}
