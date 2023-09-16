import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';
import 'pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/location':(context) => ChooseLocation()

  },
));

//home
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(onPressed: (){
            Navigator.pushNamed(context,"/location");
          },
          child: Text("Click Me"),)
        ],
      )
    );
  }
}

//location
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("location"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Text("choose location screen"),

    );
  }
}

//loading

import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Text("This is loading time"),
        color:Colors.lightBlue
      ),
    );
  }
}
