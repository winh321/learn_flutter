// main.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for using json.decode()

// to install http
// dependencies:
// http: ^1.1.0

//reference https://www.kindacode.com/article/how-to-fetch-data-from-apis-in-flutter/


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      title: 'Kindacode.com',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // The list that contains information about photos
  List _loadedPhotos = [];

  // The function that fetches data from the API
  Future<void> _fetchData() async {
    const apiUrl = 'https://raw.githubusercontent.com/kowinhtike/sketchware-training-resource/main/List%20Map/movie.json';
    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);
    setState(() {
      _loadedPhotos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kindacode.com'),
        ),
        body: SafeArea(
            child: _loadedPhotos.isEmpty ?
            Center( child: ElevatedButton(
              onPressed: _fetchData,
              child: const Text('Load Photos'),),)

            // The ListView that displays photos
                : ListView.builder(
              itemCount: _loadedPhotos.length,

              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading:  Image.network(_loadedPhotos[index]['img']),
                    title: Column(children: [
                      Text(_loadedPhotos[index]['title']),
                    ]),
                    subtitle:
                    Text('About: ${_loadedPhotos[index]["about"]}'),
                  ),
                );
              },

            )));
  }
}
