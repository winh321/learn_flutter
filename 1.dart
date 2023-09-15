import 'dart:html';

import 'package:flutter/material.dart';

void main(){
  return runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("my first app"),
          centerTitle: true,
        ),
        body:Center(
          child: Text("Hi brother yay") ,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: Text("click"),
        ),
      )
  ));
}

