import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage("assets/splashScreen/start.jpg"),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: new BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Spotify-Clone",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(
                    width: 160,
                    child: FlatButton(
                      child: Row(
                        children: [

                          Expanded(child: Text(
                            "Sign In with Spotify",
                            style: TextStyle(
                                fontSize: 11.0, fontFamily: "Raleway"),
                          ),),
                          Icon(FontAwesomeIcons.spotify),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/wait");
                      },
                      textColor: Colors.white,
                      color: Theme.of(context).accentColor,
                      shape: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 0.0,
                              color: Theme.of(context).accentColor),
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Alarmfy",
          ),
          FlatButton(
            color: Colors.green,
            onPressed: () {
              //authorizationToUseAccount();
              Navigator.pushNamed(context, "/wait");
            },
            child: Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
