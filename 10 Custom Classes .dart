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
    Quote(text: "Text One", author: "Zaw Zaw"),
    Quote(text: "Text Two", author: "Su Su"),
    Quote(text: "Text Three", author: "Aung Aung")
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
      body:Column(
        children: quotes.map((quote) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${quote.text} by ${quote.author}',style: TextStyle(
              color: Colors.red
            ),),
          )
        ).toList()
      ),
      );
  }
}

class Quote {
  late String text;
  late String author;
  Quote({required this.text,required this.author});
}

