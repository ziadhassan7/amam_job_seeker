import 'package:dio/dio.dart';
import '../../../../../../core/api/api_provider.dart';
import '../../../../../../core/api/constanst/api_key.dart';
import '../../../../../../core/api/constanst/endpoints.dart';
import '../../../../../../core/custom_log.dart';
import '../model/weather_model.dart';

class WeatherRepo {

  /// Use Weather Api
  static final DioClient _dio = DioClient(openWeatherBaseUrl);

  // Get Today's weather from location
  static Future<WeatherModel> getCurrentWeather({required String latitude, required String longitude}) async {

    try {
      Response response = await _dio.get(
          weatherEndpoint,
          queryParameters: {
            "appid": openWeatherApiKey,
            "lat": latitude,
            "lon": longitude,
            "units": "metric",
          }
      );

      return WeatherModel.fromJson(response.data);

    } catch (e) {
      Log.p("Authorization error");
      rethrow;
    }
  }
}