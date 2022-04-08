import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/album_model.dart';
import 'package:flutter_rest_api/data/repository/album_repository.dart';

class PatchScreen extends StatefulWidget {
  const PatchScreen({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('PATCH method'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 228, 110, 249),
      ),
      body: SafeArea(
        child: futurePatch(),
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
                  // Text(
                  //   'User id: ${snapshot.data!.userId.toString()}',
                  //   style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  //         fontSize: 24,
                  //         color: Colors.black,
                  //       ),
                  // ),
                  FittedBox(
                    child: Text(
                      snapshot.data!.title,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    snapshot.data!.body,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontSize: 18,
                          color: Colors.black,
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
                          // _futureAlbum = patchAlbum(
                          //   int.parse(_userIdController.text),
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
