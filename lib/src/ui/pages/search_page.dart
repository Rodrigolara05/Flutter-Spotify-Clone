import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
        child: Text("Buscar"),
      ),
    );
  }
}