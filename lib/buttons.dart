import 'package:flutter/material.dart';


class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Column(children: <Widget> [ElevatedButton(onPressed: null, child: Text('banana')), ElevatedButton(onPressed: null, child: Text('banana'))]);

    //;
  }
}