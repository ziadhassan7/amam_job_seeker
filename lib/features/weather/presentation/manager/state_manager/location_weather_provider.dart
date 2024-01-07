import 'package:amam_job_seeker_assessment/features/weather/presentation/manager/controllers/location_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final locationWeatherProvider = StateNotifierProvider<LocationWeatherProvider, Future<Position?>>((ref) {

  return LocationWeatherProvider();
});

class LocationWeatherProvider extends StateNotifier<Future<Position?>>{

  LocationWeatherProvider() : super(Future(() => null)); //default

  //request Location access
  show() {
    state = LocationController.getCurrentLocation();
  }

}