import '../../../../../profile/data/model/profile_model_data.dart';
import '../../../../../profile/data/repository/profile_repo.dart';
import '../../data/model/geo_model.dart';
import '../../data/model/weather_model.dart';
import '../../data/repository/geo_repo.dart';
import '../../data/repository/weather_repo.dart';

class WeatherController {

  static Future<WeatherModel?> getCurrentWeather(Object data) async {

    final ProfileModelData? userInfo = ProfileRepo.getProfileData(data);

    if(userInfo != null){
      if(userInfo.address != null){
        if(userInfo.address!.city != null){
          GeoModel geoLocation = await GeoRepo.getCoordinates(cityName: userInfo.address!.city!);
          double? lat = geoLocation.latitude;
          double? long = geoLocation.longitude;

          if(lat != null && long != null){
            WeatherModel weather = await WeatherRepo.getCurrentWeather(latitude: lat.toString(), longitude: long.toString());

            return weather;
          }
        }
      }
    }

    return null;
  }


}