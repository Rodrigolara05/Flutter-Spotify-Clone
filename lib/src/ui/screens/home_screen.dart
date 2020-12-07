import 'package:alarmfy/src/ui/pages/my_library_page.dart';
import 'package:alarmfy/src/ui/pages/search_page.dart';
import 'package:alarmfy/src/ui/pages/start_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(
      title: Text(
        "Spotify-Clone",
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: Colors.black54,
      centerTitle: true,
      elevation: 0.0,
    );

    BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedItemColor: Colors.white,
      //unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(
              Icons.home,
            )),
        BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(
              Icons.search,
            )),
        BottomNavigationBarItem(
            title: Text("Your library"),
            icon: Icon(
              Icons.library_music,
            )),
      ],
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );

    List<Widget> listPages = [
      new StartPage(),
      new SearchPage(),
      new MyLibraryPage(),
    ];

    Scaffold scaffold = new Scaffold(
      appBar: appBar,
      body: listPages.elementAt(selectedIndex),
      bottomNavigationBar: bottomNavigationBar,
    );

    return scaffold;
  }
}
