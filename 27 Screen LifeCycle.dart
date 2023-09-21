import 'package:flutter/material.dart';


void main() {
  runApp(
    const MaterialApp(
      home: One(),
    ),
  );
}

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: MaterialButton(
        child: Text("Next"),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Two(name: "Win Htike",age: 23,)));
        },
      ),
    );
  }
}


class Two extends StatefulWidget {


   String name = "";
   int age = 0;


  Two({required this.name,required this.age});

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
   String return_data = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Column(
        children: [
          MaterialButton(
            child: Text("Next"),
            // onPressed: (){
            //   Navigator.push(context,MaterialPageRoute(builder: (context)=> Third()));
            // },
            onPressed: () async {
            final getdata = await Navigator.push(context,MaterialPageRoute(builder: (context)=> Third()));
            setState(() {
              return_data = getdata;
            });
            },
          ),
          SizedBox(
            height: 50,
          ),
          Text("First Screen Data => name is ${widget.name} and age is ${widget.age}"),
          SizedBox(
            height: 50,
          ),
          Text("Third Screen Data => ${return_data}")
        ],
      )
    );
  }
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      body: MaterialButton(
        child: Text("Back to Second Screen"),
        onPressed: (){
         // Navigator.pop(context);
          Navigator.pop(context,"Bye Bye");
        },
      ),
    );
  }
}

