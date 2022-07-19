import 'dart:async';

import 'package:music_application/models/music_list.dart';
import 'package:music_application/networking/response.dart';
import 'package:music_application/repository/music_list_repository.dart';

class MusicListBloc {
  late MusicListRepository _musicListRepository;
  late StreamController<Response<MusicList>> _musicListController;

  // StreamSink get musicListSink => _musicListController.sink;
  // Stream get musicListStream => _musicListController.stream;

  StreamSink<Response<MusicList>> get musicListSink =>
      _musicListController.sink;

  Stream<Response<MusicList>> get musicListStream =>
      _musicListController.stream;

  MusicListBloc() {
    _musicListController = StreamController<Response<MusicList>>.broadcast();
    _musicListRepository = MusicListRepository();
    fetchMusicList();
  }

  fetchMusicList() async {
    musicListSink.add(Response.loading('Loading List.......'));

    try {
      MusicList musicList = await _musicListRepository.fetchMusicListData();
      musicListSink.add(Response.completed(musicList));
    } catch (e) {
      musicListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicListController.close();
  }
}
