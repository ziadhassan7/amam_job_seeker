import 'package:dio/dio.dart';
import '../../../../../../core/api/api_provider.dart';
import '../../../../../../core/api/constanst/api_key.dart';
import '../../../../../../core/api/constanst/endpoints.dart';
import '../../../../../../core/custom_log.dart';
import '../model/geo_model.dart';

class GeoRepo {

  /// Use Weather Api
  static final DioClient _dio = DioClient(openWeatherBaseUrl);

  // Get Today's weather from location
  static Future<GeoModel> getCoordinates({required String cityName}) async {

    try {
      Response response = await _dio.get(
          geoEndpoint,
          queryParameters: {
            "appid": openWeatherApiKey,
            "q": cityName,
          }
      );

      List data = response.data; //Get data as a list [{}]
      return GeoModel.fromJson(data.first); //parse json from list [index: 0]

    } catch (e) {
      Log("GeoRepo", e);
      rethrow;
    }
  }
}