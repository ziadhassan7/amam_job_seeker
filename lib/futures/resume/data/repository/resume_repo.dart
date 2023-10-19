import 'dart:io';
import 'package:amam_job_seeker_assessment/core/utils/file_helper.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_provider.dart';
import '../../../../core/api/constanst/api_key.dart';
import '../../../../core/api/constanst/endpoints.dart';
import '../../../../core/custom_log.dart';

class ResumeRepo {

  /// Use Weather Api
  DioClient dio = DioClient(superParserBaseUrl);

  // Get Today's weather from location
  Future<Map?> parseResume({required File file}) async {

    try {
      Response response = await dio.post(
          weatherEndpoint,
          options: Options(
            headers: {
              "X-API-Key" : superParserApiKey
            }
          ),
          data: FileHelper.getStringBytesFromFile(file),
      );

      return response.data;

    } catch (e) {
      Log("SuperParser Exception:", e);
      return null;
    }
  }

}