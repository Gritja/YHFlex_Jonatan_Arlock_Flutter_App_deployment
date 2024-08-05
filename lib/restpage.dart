import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestCallPage extends StatefulWidget {
  const RestCallPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Column(children: <Widget> [ElevatedButton(onPressed: null, child: Text('banana')), ElevatedButton(onPressed: null, child: Text('banana'))]);

    //;
  }

  @override
  State<StatefulWidget> createState() {
    return _RestCallState();
  }
}

Future <String> fetchCatFact() async {
  final response = await http.get(Uri.parse('https://cat-fact.herokuapp.com/facts/random'));
  if (response.statusCode == 200) {
    final parseJson = jsonDecode(response.body);
    return parseJson["text"];
  }
  return "No cat :C";
}



class _RestCallState extends State<RestCallPage> {
  late Future<String> futureCatFact;

  @override
  void initState(){
    super.initState();
    futureCatFact = fetchCatFact();

}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: futureCatFact,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!);
        }
        return const CircularProgressIndicator();
      }
    );
  }
  
}
