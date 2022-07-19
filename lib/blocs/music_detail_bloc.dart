import 'dart:async';

import 'package:music_application/models/music_detail.dart';
import 'package:music_application/networking/response.dart';
import 'package:music_application/repository/music_detail_repository.dart';

class MusicDetailsBloc {
  late MusicDetailsRepository _musicDetailsRepository;
  late StreamController<Response<MusicDetails>> _musicDetailsController;
  late int trackId;

  StreamSink<Response<MusicDetails>> get musicDetailsSink =>
      _musicDetailsController.sink;

  Stream<Response<MusicDetails>> get musicDetailsStream =>
      _musicDetailsController.stream;

  // StreamSink get musicDetailsSink => _musicDetailsController.sink;

  // Stream get musicDetailsStream => _musicDetailsController.stream;

  MusicDetailsBloc({trackId}) {
    _musicDetailsController =
        StreamController<Response<MusicDetails>>.broadcast();
    _musicDetailsRepository = MusicDetailsRepository(trackId: trackId);
    //fetchMusicDetails();
  }

  fetchMusicDetails() async {
    musicDetailsSink.add(Response.loading('Loading details.. '));
    try {
      MusicDetails musicDetails =
          await _musicDetailsRepository.fetchMusicDetailsData();
      musicDetailsSink.add(Response.completed(musicDetails));
    } catch (e) {
      musicDetailsSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _musicDetailsController.close();
  }
}
