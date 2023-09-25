import 'package:flutter/material.dart';
import 'model/bot_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Chat Bot'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List main_chat = [
    {
      "key": "A",
      "text": [
        "WH Digital School မှ ကြိုဆိုပါတယ်",
        "သင်တန်းစုံစမ်းရန် = AA",
        "ဆက်သွယ်ရန်အတွက် = AB"
      ]
    },
    {
      "key": "AA",
      "text": ["ဖုန်း App ရေးနည်းသင်တန်း = AAA", "Tik Tok Effect ဖန်တီးနည်း = AAB"]
    },
    {
      "key": "AAA",
      "text": ["Sketchware နဲ့ App ရေးနည်းသင်တန်းဖြစ်ပါတယ်။", "Offfline App Online App ရေးနည်း အကုန်သင်ပေးပါတယ်။", "သင်တန်းကြေးကတော့ 20000ကျပ်ပါ။"]
    },
    {
      "key": "AAB",
      "text": ["TikTok Effect ဖန်တီးနည်း တော်တော်များများကို သင်ပေးပါတယ်။", "သင်ခန်းစာ Video 30 ကျော်ရှိသွားပါပြီ","သင်တန်းကြေးကတော့ 35000ကျပ်ပါ။"]
    },

    {
      "key": "AB",
      "text": ["Ph - 09959141131", "Email - iamwinhtike@gmail.com"]
    },
  ];
  List sec_chat = [];
  String man_text = "";
  List suggest = ["A"];

  TextEditingController ted = TextEditingController();

  QuestionAdded(String ques){
    //reset gues button
    suggest = [];
    sec_chat.add(BotData.insertData(sender: "man", text: ques));

    var ll = [];
    for (int i = 0; i < main_chat.length; i++) {
      if (main_chat[i]["key"].toLowerCase() ==
          ques.toLowerCase()) {
        var mini_list = main_chat[i]["text"];
        for (int r = 0; r < mini_list.length; r++) {
          //print(mini_list[r]);
          String x = mini_list[r];
          sec_chat.add(BotData.insertData(sender: "robot", text: mini_list[r]));
          if(x.indexOf("=") >= 0){
            suggest.add(x.substring(x.indexOf("=")+1,x.length).trim());
          }
        }
        break;
      }
    }
    //show the chat list
    print(sec_chat);
    //ease the input of ted
    ted.text = "";
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Column(
          children: [

            Container(
              width: 360,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sec_chat.map((quote) {
                    if (quote['sender'] == "man") {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${quote["text"]}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("img/man.png"),
                              radius: 10,
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("img/robot.png"),
                            radius: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${quote["text"]}',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList()),
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: suggest.map((quote){
                  return MaterialButton(onPressed:(){
                    QuestionAdded(quote);
                  },child: Text(quote),);
                }).toList()),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    controller: ted,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    QuestionAdded(ted.text);
                  },
                  child: Text("send"),
                )
              ],
            )

          ],
        )
    );
  }
}
