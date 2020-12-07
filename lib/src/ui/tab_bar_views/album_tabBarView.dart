import 'package:flutter/material.dart';

class AlbumTabBar extends StatefulWidget {
  AlbumTabBarState createState() => new AlbumTabBarState();
}

class AlbumTabBarState extends State<AlbumTabBar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
        child: Text("Albums"),
      ),
    );
  }
}