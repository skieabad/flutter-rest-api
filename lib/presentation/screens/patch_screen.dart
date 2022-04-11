import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/album_model.dart';
import 'package:flutter_rest_api/presentation/base/stateful_widget_base.dart';

import '../../data/repositories/album_repository.dart';

class PatchScreen extends StatefulWidgetBase {
  const PatchScreen({Key? key, title = 'Patch'})
      : super(key: key, title: title);

  @override
  State<PatchScreen> createState() => _PatchScreenState();
}

class _PatchScreenState extends State<PatchScreen> {
  final TextEditingController _bodyController = TextEditingController();
  late Future<Album>? _futureAlbum;

  @override
  void initState() {
    super.initState();
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
          title: const Text('PATCH method'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 228, 110, 249),
        ),
        body: SafeArea(
          child: futurePatch(),
        ),
      ),
    );
  }

  Widget futurePatch() {
    return FutureBuilder<Album>(
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
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: TextField(
                      controller: _bodyController,
                      decoration: const InputDecoration(
                        hintText: 'Update body',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 228, 110, 249)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 228, 110, 249)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 228, 110, 249)),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 46,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _futureAlbum = patchAlbum(_bodyController.text);
                          _bodyController.clear();
                        });
                      },
                      child: const Text('Patch data'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 228, 110, 249),
                      ),
                    ),
                  ),
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
            color: Color.fromARGB(255, 228, 110, 249),
          ),
        );
      },
    );
  }
}
