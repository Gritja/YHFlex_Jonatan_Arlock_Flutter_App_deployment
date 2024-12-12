import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_drive/buttons.dart';
import 'dart:convert';

import 'package:test_drive/main.dart';

class RestCallPage extends StatefulWidget {
  const RestCallPage({super.key});

  @override
  State<RestCallPage> createState() => _RestCallPageState();
}

class _RestCallPageState extends State<RestCallPage> {
  late Future<String> futureCatFact;

  @override
  void initState() {
    super.initState();
    futureCatFact = fetchCatFact();
  }

  Future<String> fetchCatFact() async {
    final response = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
    if (response.statusCode == 200) {
      final parseJson = jsonDecode(response.body);
      return parseJson["value"];
    }
    return "No cat :C";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Fact'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: futureCatFact,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  futureCatFact = fetchCatFact();
                });
              },
              child: Text('Get New Fact'),
            ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ButtonsPage()));
          },
          child: Text('Go to Buttons Page'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
          },
          child: Text('Go Back'),
        )],
        ),
      ),
    );
  }
}