import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: "Be yourself,everyone else is already taken Osca Wise", author: "Zaw Zaw"),
    Quote(text: "I have nothing to declare except m genius Osca Wide", author: "Su Su"),
    Quote(text: "The truth is rarely pure and never simple Osca Wide", author: "Aung Aung")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(

          children: quotes.map((quote) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('${quote.text}',
                          style: TextStyle(
                            color: Colors.red,
                          ),),
                        Text(' by ${quote.author}',style: TextStyle(
                            color: Colors.red
                        ),),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 50,)
            ],
          )
          ).toList()
        ),
      ),
      );
  }
}

class Quote {
  late String text;
  late String author;
  Quote({required this.text,required this.author});
}

