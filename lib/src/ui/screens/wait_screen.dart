import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alarmfy/src/blocs/authorization_bloc.dart';
import 'package:alarmfy/src/models/authorization_model.dart';
import 'package:flutter/material.dart';

class WaitScreen extends StatefulWidget {
  @override
  _WaitScreenState createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {

  addTokenToSF(AsyncSnapshot<AuthorizationModel> snapshot) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', snapshot.data.accessToken);
    prefs.setString('token_type', snapshot.data.tokenType);
    prefs.setString('refresh_token', snapshot.data.refreshToken);
    prefs.setBool('logged', true);
  }

  @override
  Widget build(BuildContext contextBuild) {
    authorizationBloc.fetchAuthorizationCode();

    _bienvenido() {
      authorizationBloc.disposeToken();
      Timer(Duration(microseconds: 0),
              () => Navigator.pushNamedAndRemoveUntil(context,"/home", (route)=>false));
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: StreamBuilder(
        stream: authorizationBloc.authorizationCode,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == "access_denied") {
              Navigator.pop(contextBuild);
            } else {
              authorizationBloc.fetchAuthorizationToken(snapshot.data);
              return StreamBuilder(
                stream: authorizationBloc.authorizationToken,
                builder: (context, AsyncSnapshot<AuthorizationModel> snapshot) {
                  if (snapshot.hasData) {
                    print("FINAL DATA");
                    print('access_token: ${snapshot.data.accessToken}');
                    print("token_type: ${snapshot.data.tokenType}");
                    print("expires_in: ${snapshot.data.expiresIn}");
                    print("refresh_token: ${snapshot.data.refreshToken}");
                    print("scope: ${snapshot.data.scope}");
                    addTokenToSF(snapshot);
                    return _bienvenido();
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
