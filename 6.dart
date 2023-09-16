import 'dart:html';

import 'package:flutter/material.dart';

void main(){
  return runApp(MaterialApp(
      home:Home()
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my first app pr"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello"),
              Text("Win Htike  "),
              Icon(Icons.child_care),
              Image.asset("assets/face_mesh.png",
              width: 100,)
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.cyan,
            child:Text("one")
          ),
          Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.red,
              child:Text("two")
          ),
          Container(
              padding: EdgeInsets.all(40.0),
              color: Colors.yellow,
              child:Text("three")
          )
        ],

      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.red,
        child: Text("click"),
      ),
    );
  }
}




