import 'package:dio/dio.dart';
import '../../../../core/api/api_provider.dart';
import '../../../../core/api/constanst/api_key.dart';
import '../../../../core/api/constanst/endpoints.dart';
import '../model/weather_model.dart';

class WeatherRepo {

  /// Use Weather Api
  DioClient dio = DioClient(openWeatherBaseUrl);

  // Get Today's weather from location
  Future<WeatherModel> getCurrentWeather({required String latitude, required String longitude}) async {

    try {
      Response response = await dio.get(
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
      print("Authorization error");
      rethrow;
    }
  }
}