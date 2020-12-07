
import 'package:alarmfy/src/models/list_playlist_model.dart';
import 'package:alarmfy/src/models/tracks_playlist_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class PlaylistBloc {
  final _repository = RepositoryPlaylist();

  final PublishSubject _playlist_list_Fetcher = PublishSubject<ListPlaylistModel>();
  final PublishSubject _tracks_list_Fetcher = PublishSubject<TracksPlaylistModel>();

  Observable<ListPlaylistModel> get playlistList => _playlist_list_Fetcher.stream;
  Observable<TracksPlaylistModel> get tracksList => _tracks_list_Fetcher.stream;

  fetchPlaylistList() async {
     ListPlaylistModel code = await _repository.fetchPlaylistList();
    _playlist_list_Fetcher.sink.add(code);
  }
  fetchTracksList(String url) async {
    TracksPlaylistModel tracks = await _repository.fetchTracksList(url);
    _tracks_list_Fetcher.sink.add(tracks);
  }

  disposePlaylist() {
    _playlist_list_Fetcher.close();
  }
  disposeTracks() {
    _tracks_list_Fetcher.close();
  }
}

final PlaylistBloc playlistBloc = PlaylistBloc();