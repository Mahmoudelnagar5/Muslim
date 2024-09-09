import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);
  Future<Map<String, dynamic>> get() async {
    var response = await _dio.get('https://equran.id/api/v2/surat/');
    // print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> getAyat(String id) async {
    var respone = await _dio.get('https://equran.id/api/v2/surat/$id');
    // print(respone.data);
    return respone.data;
  }

  Future<Map<String, dynamic>> getPrayer() async {
    var respone = await _dio.get(
        'https://api.aladhan.com/v1/timingsByCity/09-09-2024?city=cairo&country=egypt');
    // print(respone.data);
    return respone.data;
  }

  Future<Map<String, dynamic>> getAllRecitations() async {
    var respone = await _dio
        .get('https://api.quran.com/api/v4/resources/recitations?language=ar');
    // print(respone.data);
    return respone.data;
  }

  Future<Map<String, dynamic>> getSurahAudio(
      String reciterId, String chapterId) async {
    var respone = await _dio.get(
        'https://api.quran.com/api/v4/chapter_recitations/$reciterId/$chapterId');
    // print(respone.data);
    return respone.data;
  }
}
