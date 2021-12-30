import 'package:dio/dio.dart';

class WebService {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> PostData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang='en',
    String? token,
  }) async {
    dio.options.headers={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
   return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang='en',
    String? token,
  }) async {
    dio.options.headers={
      'Content-Type': 'application/json',
      'lang':lang,
      'Authorization':token??'',
    };
    return dio.get(url, queryParameters: query,);
  }

}
