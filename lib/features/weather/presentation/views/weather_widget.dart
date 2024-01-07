import 'package:amam_job_seeker_assessment/features/weather/presentation/manager/state_manager/location_weather_provider.dart';
import 'package:amam_job_seeker_assessment/features/weather/presentation/views/sub/info_weather.dart';
import 'package:amam_job_seeker_assessment/features/weather/presentation/views/sub/stamp_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';


class WeatherWidget extends ConsumerWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return FutureBuilder<Position?>(
        future: ref.watch(locationWeatherProvider),
        builder: (context, snapshot) {

          return (snapshot.hasData)
            ? InfoWeather(data: snapshot.data!)
            : const StampWeather();
        }
    );
  }
}
