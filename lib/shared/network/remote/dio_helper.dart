import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://magdsoft-internship.herokuapp.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {};
    return dio.post(url, queryParameters: query, data: data);
  }
}
