import 'package:music_application/constant.dart';
import 'package:music_application/models/music_lyrics.dart';
import 'dart:async';

import 'package:music_application/networking/api_provider.dart';

class MusicLyricsRepository {
  final int trackId;
  MusicLyricsRepository({required this.trackId});
  ApiProvider _provider = ApiProvider();
  Future<MusicLyrics> fetchMusicDetailsData() async {
    final response = await _provider
        .get("track.lyrics.get?track_id=$trackId&apikey=$apikey");
    return MusicLyrics.fromJson(response);
  }
}
