import 'package:geolocator/geolocator.dart';
import '../../../data/model/weather_model.dart';
import '../../../data/repository/weather_repo.dart';

class WeatherController {

  static Future<WeatherModel> getCurrentWeather(Position data) async {
    double lat = data.latitude;
    double long = data.longitude;

    return await WeatherRepo.getCurrentWeather(latitude: lat, longitude: long);
  }

}