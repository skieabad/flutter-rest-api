import 'package:flutter/material.dart';
import '../widgets/main_buttons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mainButtons(() => Navigator.of(context).pushNamed('/get'),
                  'Get method', const Color.fromARGB(255, 28, 123, 130)),
              mainButtons(() => Navigator.of(context).pushNamed('/add'),
                  'Post method', Colors.blue),
              mainButtons(() => Navigator.of(context).pushNamed('/update'),
                  'Put method', Colors.black),
              mainButtons(() => Navigator.of(context).pushNamed('/patch'),
                  'Patch method', const Color.fromARGB(255, 228, 110, 249)),
              mainButtons(() => Navigator.of(context).pushNamed('/delete'),
                  'Delete method', const Color.fromARGB(255, 243, 86, 33)),
            ],
          ),
        ),
      ),
    );
  }
}
