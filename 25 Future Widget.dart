import 'package:flutter/material.dart';

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
        body: LFutureBuilder(),
      )
    );
  }
}


class LFutureBuilder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LFutureBuilder> {
  Future<String> _countDown = Future<String>.delayed(
    Duration(seconds: 5), (){
      print("Data loaded");
      return "Data already has been refresh!";
  },
  );

  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _countDown, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            ),
            Text('Result: ${snapshot.data}')
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
        Text('Error: ${snapshot.error}')
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            )
          ];
        }

        //show the latest output
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}

