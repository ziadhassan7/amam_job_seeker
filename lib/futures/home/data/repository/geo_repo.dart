import 'package:dio/dio.dart';
import '../../../../core/constanst/api_key.dart';
import '../../../../core/api_provider.dart';
import '../../../../core/constanst/endpoints.dart';
import '../model/geo_model.dart';

class GeoRepo {

  /// Use Weather Api
  DioClient dio = DioClient(openWeatherBaseUrl);

  // Get Today's weather from location
  Future<GeoModel> getCoordinates({required String cityName}) async {

    try {
      Response response = await dio.get(
          geoEndpoint,
          queryParameters: {
            "appid": weatherApiKey,
            "q": cityName,
          }
      );

      List data = response.data; //Get data as a list [{}]
      return GeoModel.fromJson(data.first); //parse json from list [index: 0]

    } catch (e) {
      print("Error in code: Dio $e");
      rethrow;
    }
  }
}