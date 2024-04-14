import 'package:dio/dio.dart';

class DioClient {

  final Dio _dio = Dio();
  final Duration _timeout = const Duration(milliseconds: 30000);

  DioClient(String baseUrl){
    _dio
      ..options.baseUrl = baseUrl
      ..options.responseType = ResponseType.json
      ..options.connectTimeout = _timeout
      ..options.receiveTimeout = _timeout;
  }


  Future<Response> get(
      String url, {
        Options? options,
        Map<String, dynamic>? queryParameters,
      }) async {

    try {
      final Response response = await _dio.get(
        url,
        options: options,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
      String url, {
        dynamic data,
        Options? options,
        Map<String, dynamic>? queryParameters,
      }) async {

    try {
      final Response response = await _dio.post(
        url,
        queryParameters: queryParameters,
        options: options,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}