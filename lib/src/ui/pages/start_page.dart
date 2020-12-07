import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPageState createState() => new StartPageState();
}

class StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
        child: Text("Inicio"),
      ),
    );
  }
}