import 'package:dio/dio.dart';
import '../../../../core/api_key.dart';
import '../../../../core/api_provider.dart';
import '../../../../core/endpoints.dart';
import '../model/weather_model.dart';

class GetWeatherRepo {

  /// Use Weather Api
  DioClient dio = DioClient(weatherBaseUrl);

  // Get Today's weather from location
  Future<WeatherModel> getCurrentWeather({required String latitude, required String longitude}) async {

    try {
      Response response = await dio.get(
          endpoint,
          queryParameters: {
            "apikey": weatherApiKey,
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