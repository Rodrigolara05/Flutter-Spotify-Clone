import 'package:alarmfy/src/ui/tab_bar_views/album_tabBarView.dart';
import 'package:alarmfy/src/ui/tab_bar_views/artist_tabBarView.dart';
import 'package:alarmfy/src/ui/tab_bar_views/playlist_tabBarView.dart';
import 'package:flutter/material.dart';

class MyLibraryPage extends StatefulWidget {
  MyLibraryPageState createState() => new MyLibraryPageState();
}

class MyLibraryPageState extends State<MyLibraryPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, initialIndex: 0, length: 3)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Container tabBar = new Container(
      decoration: new BoxDecoration(color: Colors.black54,),
      child: new TabBar(
        controller: tabController,
        tabs: [
          new Tab(
            text: 'Playlists',
          ),
          new Tab(
            text: 'Artists',
          ),
          new Tab(
            text: 'Albums',
          ),
        ],
      ),
    );

    Container tabBarView = new Container(
      height: 80.0,
      child: new TabBarView(
        controller: tabController,
        children: <Widget>[
          new PlaylistTabBar(),
          new ArtistTabBar(),
          new AlbumTabBar(),
        ],
      ),
    );

    return new Column(
      children: <Widget>[
        tabBar,
        Expanded(
          child: Container(
            decoration: new BoxDecoration(color: Colors.black54,),
            child: tabBarView,
          ),
        )
      ],
    );
  }
}
