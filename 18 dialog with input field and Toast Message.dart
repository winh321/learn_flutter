import 'package:flutter/material.dart';


void main() {
  runApp(const MaterialApp(
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final TextEditingController tec = TextEditingController();

  _show(){
   return showDialog(context: context, builder:(BuildContext context){
     return AlertDialog(
       title: Column(
         children: [
           Text("What is your name"),
           TextField(
             controller: tec,
           )
         ],
       ),
       //content: const Text("Warnging"),
       actions: [
         MaterialButton(onPressed: (){
           Navigator.of(context).pop();
         },
         child: const Text("Cancel"),),
         MaterialButton(onPressed: (){
           Navigator.of(context).pop();
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
             backgroundColor: Colors.red,
               content: Text('Your Name is ${tec.text}')
           ));
         },
           child: const Text("Show"),)
       ],
     );
   });
  }



  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("My App")
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: _show,
              child: const Text("Show Dialog"),
            ),

          ],
        )

  );
  }
}
