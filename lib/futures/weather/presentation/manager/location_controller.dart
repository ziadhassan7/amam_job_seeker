import '../../data/model/geo_model.dart';
import '../../data/repository/geo_repo.dart';

class LocationController {

  static Future<GeoModel> getLocationByCity(String city) async {
    GeoModel model = await GeoRepo.getCoordinates(cityName: city);
    return model;
  }

}