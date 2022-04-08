import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/album_model.dart';
import 'package:flutter_rest_api/data/repository/album_repository.dart';
import 'package:flutter_rest_api/presentation/base/stateful_widget_base.dart';

class DeleteScreen extends StatefulWidgetBase {
  const DeleteScreen({Key? key, title = 'Delete'})
      : super(key: key, title: title);

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final TextEditingController _titleController = TextEditingController();
  late Future<Album>? _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
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
          title: const Text('DELETE method'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 243, 86, 33),
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
                  Text(
                    snapshot.data?.title ?? 'Deleted successfully',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                    child: TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter id',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 86, 33)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 86, 33)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 243, 86, 33)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 230,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            _futureAlbum =
                                deleteAlbum(int.parse(_titleController.text));
                            _titleController.clear();
                          },
                        );
                      },
                      child: const Text('Delete data'),
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 243, 86, 33)),
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
            color: Color.fromARGB(255, 243, 86, 33),
          ),
        );
      },
    );
  }
}
