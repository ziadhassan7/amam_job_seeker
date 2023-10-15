import 'package:amam_job_seeker_assessment/futures/weather/data/model/geo_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/api_key.dart';
import '../../../../core/api_provider.dart';
import '../../../../core/endpoints.dart';

class GeoRepo {

  /// Use Weather Api
  DioClient dio = DioClient(openWeatherBaseUrl);

  // Get Today's weather from location
  Future<GeoModel> getCurrentWeather({required String cityName}) async {

    try {
      Response response = await dio.get(
          geoEndpoint,
          queryParameters: {
            "apikey": weatherApiKey,
            "q": cityName,
          }
      );

      return GeoModel.fromJson(response.data);

    } catch (e) {
      print("Authorization error");
      rethrow;
    }
  }
}