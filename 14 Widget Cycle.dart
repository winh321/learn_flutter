import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print("build now");
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("location"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: MaterialButton(
        onPressed: (){
          setState(() {
            counter += 1;
          });
        },
        child: Text('Counter is ${counter}'),
      )

    );
  }

  @override
  void initState() {
    super.initState();
    print("Begin Page");
  }
}
