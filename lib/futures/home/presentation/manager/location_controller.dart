import '../../data/model/geo_model.dart';
import '../../data/repository/geo_repo.dart';

class LocationController {
  static final GeoRepo _geocoding = GeoRepo();

  static Future<GeoModel> getLocationByCity(String city) async {
    GeoModel model = await _geocoding.getCoordinates(cityName: city);
    return model;
  }

}