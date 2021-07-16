import 'package:dio/dio.dart';

import 'package:admin_dashboard/services/local_storage.dart';

class CafeApi {
  static Dio _dio = new Dio();

  static void configureDio() {
    /* Url base */
    _dio.options.baseUrl = 'http://localhost:8080/api';
    /* Cabeceras */
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioError catch (e) {
      throw ('ERROR ==> cafe_api | httpGet | $e');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);
      return response.data;
    } on DioError catch (e) {
      throw ('ERROR ==> cafe_api | httpPost | $e');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.put(path, data: formData);
      return response.data;
    } on DioError catch (e) {
      throw ('ERROR ==> cafe_api | httpPut | $e');
    }
  }

  static Future httpDelete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.delete(path, data: formData);
      return response.data;
    } on DioError catch (e) {
      throw ('ERROR ==> cafe_api | httpDelete | $e');
    }
  }
}
