import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      home: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu,
              color: Colors.white,
              size: 30,),
             Container(
               child: CircleAvatar(
                 backgroundImage:AssetImage("img/profile.png"),
                 radius: 20,
               ),
             )


            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(30),
                ),
                child:TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                   // border:InputBorder.none,
                  ),

                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Text("All ToDos",style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),)),
              ),

              Container(
                child:Expanded(
                  child: ListView(
                    children: [
                      ToDoItem(title:"Hi"),
                      ToDoItem(title: "Hello"),
                      ToDoItem(title: "Three"),
                      ToDoItem(title:"Hi"),
                      ToDoItem(title: "Hello"),
                      ToDoItem(title: "Three"),
                      ToDoItem(title:"Hi"),
                      ToDoItem(title: "Hello"),
                      ToDoItem(title: "Three"),
                      ToDoItem(title:"Hi"),
                      ToDoItem(title: "Hello"),
                      ToDoItem(title: "Three"),
                      ToDoItem(title:"Hi"),
                      ToDoItem(title: "Hello"),
                      ToDoItem(title: "Three"),
                      ToDoItem(title:"Hi"),
                      ToDoItem(title: "Hello"),

                    ],
                  ),
                ) ,
              )



            ],
          )
        ),
      );
  }
}

class ToDoItem extends StatelessWidget {


  late String mydata = "";

  ToDoItem({required String title}){
    this.mydata = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.white,
        child: ListTile(
          onTap: (){
            print("click");
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          tileColor: Colors.black,
          title: Text('Note is ${mydata}'),
          leading: Icon(Icons.check_box,
            color: Colors.blue,),
        )
    );
  }
}


