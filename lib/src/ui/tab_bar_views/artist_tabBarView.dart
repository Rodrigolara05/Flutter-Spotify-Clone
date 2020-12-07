import 'package:flutter/material.dart';

class ArtistTabBar extends StatefulWidget {
  ArtistTabBarState createState() => new ArtistTabBarState();
}

class ArtistTabBarState extends State<ArtistTabBar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
        child: Text("Artists"),
      ),
    );
  }
}