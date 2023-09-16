 Row(

        children: [
          Expanded(
            flex: 3,
              child: Image.asset("assets/face_mesh.png")),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Text("One"),
              color: Colors.cyan,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Text("Two"),
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Text("Three"),
              color: Colors.yellow,
            ),
          ),

        ],

      ),
