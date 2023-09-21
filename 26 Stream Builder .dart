import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Future<String> _countDown = Future<String>.delayed(Duration(seconds: 5),()=> "MY Data");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: LStreamBuilder(),
      )
    );
  }
}



class LStreamBuilder extends StatelessWidget {

  //set the array data
  List data = ["one","two","three","four","five","six","seven","eight","nine","ten"];

  Stream<int> counter() async* {
    int i = 0;
    while (true) {
      await Future.delayed(Duration(seconds: 2));
      yield i++;
      if (i == (data.length)) break;
    }
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: counter(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Fetching the data...");
          }
          print( snapshot.data);
          return Text(" ${data[snapshot.data!]}",
              style: TextStyle(fontSize: 40));
        },
      ),
    );
  }
}

