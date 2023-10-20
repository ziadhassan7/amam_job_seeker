import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/api/api_provider.dart';
import '../../../../core/api/constanst/api_key.dart';
import '../../../../core/api/constanst/endpoints.dart';
import '../../../../core/custom_log.dart';
import 'package:http_parser/http_parser.dart';

class ResumeRepo {

  /// Use Weather Api
  static final DioClient _dio = DioClient(superParserBaseUrl);

  // Get resume data from file
  static Future<Map?> parseResume({required File file}) async {

    final formData = FormData.fromMap({
      'file_name': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: MediaType('application', 'pdf'), //MediaType.parse(lookupMimeType(file.path))
      ),
    });

    try {
      Response response = await _dio.post(
          parseEndpoint,
          options: Options(headers: {"X-API-Key" : superParserApiKey}),
          data: formData,
      );

      return response.data;

    } catch (e) {
      Log("SuperParser Exception:", e);
      return null;
    }
  }

  // Get resume data from link
  static Future<Map?> parseUrlResume({required String resumeUrl}) async {


    Log.p(resumeUrl,);

    try {
      Response response = await _dio.post(
        urlEndpoint,
        options: Options(
            validateStatus: (status) => true,
            headers: {"X-API-Key" : superParserApiKey,}),
        data: {"resume_url": resumeUrl},
      );

      return response.data;

    } catch (e) {
      Log("SuperParser Exception:", e);
      return null;
    }
  }

}