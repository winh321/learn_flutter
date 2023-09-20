import 'dart:html';

import 'package:flutter/material.dart';

void main(){
  return runApp(MaterialApp(
      home:Home()
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isDropped = false;
  var _color = "red";
  bool _isget = false ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my first app pr"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Scaffold(
          body: Scaffold(
              body: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LongPressDraggable<String>(
                        // Data is the value this Draggable stores.
                        data: _color,
                        child: Container(
                          height: 150.0,
                          width: 150.0,
                          color: Colors.redAccent,
                          child: const Center(
                            child: Text(
                              'Drag me',
                              textScaleFactor: 2,
                            ),
                          ),
                        ),
                        feedback: Material(
                          child: Container(
                            height: 170.0,
                            width: 170.0,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                            ),
                            child: const Center(
                              child: Text(
                                'Dragging',
                                textScaleFactor: 2,
                              ),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      DragTarget<String>(
                        builder: (
                            BuildContext context,
                            List<dynamic> accepted,
                            List<dynamic> rejected,
                            ) {
                          return ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              height: 200,
                              width: 200,
                              color: _isDropped ? Colors.green : Colors.grey,
                              child: Center(
                                  child: Text(
                                    !_isDropped ? 'Drop here' : 'Dropped',
                                    textScaleFactor: 2,
                                  )),
                            ),
                          );
                        },
                        onAccept: (data) {
                          debugPrint('hi $data');
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successful")));
                            _isDropped = true;
                          });
                        },
                        onWillAccept: (data) {
                          return data == _color;
                        },
                        onLeave: (data) {

                        },
                      ),
                    ],
                  ),
                ),
              ))

          ),

    );
  }
}
