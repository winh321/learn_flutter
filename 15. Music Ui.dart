import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Audio Reading",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List popularBookList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      popularBookList = [
        {
          "rating": "4.5",
          "title": "One",
          "text": "One Text",
          "img":"img/thumb.jpg",
          "audio": "Voices.mp3"
        },
        {
          "rating": "4.0",
          "title": "Two",
          "text": "Two Text",
          "img":"img/two.png",
          "audio": "Voices.mp3"
        },
        {
          "rating": "4.7",
          "title": "Three",
          "text": "Three Text",
          "img":"img/three.jpg",
          "audio": "Voices.mp3"
        }

      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add_chart_sharp,
                        size: 30,color: Colors.red,),
                      Row(
                        children: [
                          Icon(Icons.add,
                            size: 30,color: Colors.red,),
                          SizedBox(width: 10,),
                          Icon(Icons.add_alert_sharp,
                            size: 30,color: Colors.red,)

                        ],
                      )
                    ],
                  ),

                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text("Popular Books",style: TextStyle(
                          fontSize: 30
                      ),),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 220,
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 1),
                      itemCount: popularBookList == null? 0: popularBookList.length,
                      itemBuilder: (_,i){
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                  image: AssetImage(popularBookList[i]["img"])
                              )
                          ),
                        );
                      }),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text("New",style: TextStyle(color: Colors.white),),
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Container(
                        child: Text("Popular",style: TextStyle(color: Colors.white),),
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Container(
                        child: Text("Trending",style: TextStyle(color: Colors.white),),
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )

                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }


}

