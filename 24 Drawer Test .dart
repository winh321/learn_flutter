import 'dart:html';

import 'package:flutter/material.dart';

void main(){
  return runApp(MaterialApp(
    home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text("Drawer Header",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25
                ),),decoration:
                BoxDecoration(
                  color: Colors.blue
                ),),
              ListTile(
                title: Text("Alarm"),
                leading:Icon(Icons.alarm) ,
                onTap: (){
                  print("alarm click");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Message"),
                leading:Icon(Icons.message) ,
                onTap: (){
                  print("Message click");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Call List"),
                leading:Icon(Icons.call) ,
                onTap: (){
                  setState(() {
                    print("CallList click");
                    Navigator.pop(context);
                  });
                },
              )
            ],
          ),
        ),);
  }
}
