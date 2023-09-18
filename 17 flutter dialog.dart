import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _show(){
   return showDialog(context: context, builder:(BuildContext context){
     return AlertDialog(
       title: Text("Hi"),
       content: Text("Warnging"),
       actions: [
         MaterialButton(onPressed: (){
           Navigator.of(context).pop();
         },
         child: Text("Cancel"),),
         MaterialButton(onPressed: (){
           Navigator.of(context).pop();
         },
           child: Text("Cancel"),)
       ],
     );
   });
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("My App")
      ),
        body: MaterialButton(
          onPressed: _show,
          child: Text("Show Dialog"),
        ),

  );
  }
}
