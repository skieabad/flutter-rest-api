import 'package:flutter/material.dart';
import 'package:flutter_rest_api/data/models/photos_model.dart';
import 'package:flutter_rest_api/data/repository/photos_repository.dart';
import 'package:flutter_rest_api/presentation/base/stateless_widget_base.dart';

import '../widgets/get_screen_widgets.dart';

class GetScreen extends StatelessWidgetBase {
  const GetScreen({Key? key, title = 'Get'}) : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title!,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
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
      ),
    );
  }
}
