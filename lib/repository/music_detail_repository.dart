import 'package:music_application/constant.dart';
import 'package:music_application/models/music_detail.dart';
import 'package:music_application/networking/api_provider.dart';

class MusicDetailsRepository {
  final int trackId;
  MusicDetailsRepository({required this.trackId});
  ApiProvider _provider = ApiProvider();
  Future<MusicDetails> fetchMusicDetailsData() async {
    final response =
        await _provider.get("track.get?track_id=$trackId&apikey=$apikey");
    return MusicDetails.fromJson(response);
  }
}
