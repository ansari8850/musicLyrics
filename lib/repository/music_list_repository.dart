import 'package:music_application/constant.dart';
import 'package:music_application/models/music_list.dart';
import 'package:music_application/networking/api_provider.dart';
import 'package:music_application/networking/response.dart';

class MusicListRepository {
  ApiProvider _provider = ApiProvider();

  Future<MusicList> fetchMusicListData() async {
    final response = await _provider.get('chart.tracks.get?apikey=$apikey');
    return MusicList.fromJson(response);
  }
}
