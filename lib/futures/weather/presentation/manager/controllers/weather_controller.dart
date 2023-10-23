import 'package:location/location.dart';
import '../../../data/model/weather_model.dart';
import '../../../data/repository/weather_repo.dart';

class WeatherController {

  static Future<WeatherModel?> getCurrentWeather(LocationData data) async {
    double? lat = data.latitude;
    double? long = data.longitude;

    if(lat != null && long != null){
      return await WeatherRepo.getCurrentWeather(latitude: lat, longitude: long);
    }

  return null;
  }

}