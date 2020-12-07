import 'dart:async';
import 'package:alarmfy/src/models/authorization_model.dart';
import 'package:alarmfy/src/models/tracks_playlist_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TracksPlaylistApiProvider {
  Client client = Client();

  Future<TracksPlaylistModel> fetchTracks(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String access_token = prefs.getString('access_token');
    String token_type = prefs.getString('token_type');

    String AuthorizationWithToken = '${token_type} ${access_token}';
    var response = await client.get(url,headers: {'Authorization' : AuthorizationWithToken});

    //SI SE NECESITA NUEVO TOKEN
    if (response.statusCode == 401) {
      String refresh_token = prefs.getString('refresh_token');
      String client_id = "YOURCLIENTIDHERE";
      String client_secret ="YOURCLIENTSECRETHERE";
      String AuthorizationStr = "$client_id:$client_secret";
      var bytes = utf8.encode(AuthorizationStr);
      var base64Str = base64.encode(bytes);
      String Authorization= 'Basic ' + base64Str;
      var responseNewToken = await client.post("https://accounts.spotify.com/api/token", body: {
        'grant_type': 'refresh_token',
        'refresh_token': refresh_token,
        'redirect_uri': 'alarmfy:/'
      },headers: {'Authorization' : Authorization});

      if (responseNewToken.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        AuthorizationModel aM =  AuthorizationModel.fromJson(json.decode(responseNewToken.body));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('access_token', aM.accessToken);
        prefs.setString('token_type', aM.tokenType);
        prefs.setBool('logged', true);

        access_token = prefs.getString('access_token');
        token_type = prefs.getString('token_type');
        String AuthorizationWithToken = '${token_type} ${access_token}';
        response = await client
            .get(url, headers: {'Authorization': AuthorizationWithToken});
        print("Se dio un nuevo token!");
      } else {
        // If that call was not successful, throw an error.
        throw Exception('Failed to request a new token');
      }

    }

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return TracksPlaylistModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load tracks');
    }
  }
}