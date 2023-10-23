import 'package:amam_job_seeker_assessment/futures/weather/presentation/manager/controllers/location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationWeatherProvider = StateNotifierProvider<LocationWeatherProvider, Future<LocationData?>>((ref) {

  return LocationWeatherProvider();
});

class LocationWeatherProvider extends StateNotifier<Future<LocationData?>>{

  LocationWeatherProvider() : super(Future(() => null)); //default

  //request Location access
  show() {
    state = LocationController.getCurrentLocation();
  }

}