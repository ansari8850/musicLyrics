import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:music_application/networking/custom_exception.dart';

// import 'custom_exception,dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final String _baseUrl = "https://api.musixmatch.com/ws/1.1/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url.trim()));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Comminication with server with Statuscode:  ${response.statusCode}');
    }
  }
}
