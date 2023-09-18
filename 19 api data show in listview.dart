import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// to install http
// dependencies:
// http: ^1.1.0

//refence https://docs.flutter.dev/cookbook/networking/fetch-data


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //set variable
  String apidata = "";
  List listdata = [{"d":"","n":""}];

  Widget quoteTemplate(quote){
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(quote["d"],
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600]
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(quote["n"],
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800]
              ),),
            Text(quote["v"],
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800]
              ),)
          ],
        ),
      ),
    );
  }

  fetchApi() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/winh321/Note/main/3dnotepro.txt'));
    if (response.statusCode == 200) {
      setState(() {
        listdata = jsonDecode(response.body);
        apidata = response.body;
      });
    }
    // else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
  }

  @override
  void initState() {
    super.initState();
    //call api
    fetchApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: Expanded(
            child: ListView(
                children: listdata.map((quote) => quoteTemplate(quote)).toList()
            ),
          )
      ),
    ));
  }
}
