import 'package:alarmfy/src/ui/screens/home_screen.dart';
import 'package:alarmfy/src/ui/screens/login_screen.dart';
import 'package:alarmfy/src/ui/screens/splash_screen.dart';
import 'package:alarmfy/src/ui/screens/tracks_screen.dart';
import 'package:alarmfy/src/ui/screens/wait_screen.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        accentColor: Colors.green,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginScreen(),
        '/home': (BuildContext context) => new HomeScreen(),
        '/splash': (BuildContext context) => new SplashScreen(),
        '/tracks': (BuildContext context) => new TracksScreen(),
        '/wait': (BuildContext context) => new WaitScreen(),
      },
    );
  }
}