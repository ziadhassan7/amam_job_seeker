import 'package:amam_job_seeker_assessment/futures/weather/presentation/manager/state_manager/location_weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'base_weather_widget.dart';

class StampWeather extends ConsumerWidget {
  const StampWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(

      onTap: (){
        ref.read(locationWeatherProvider.notifier).show();
      },

      child: const BaseWeatherWidget(
          asset: "assets/weather/clouds.svg",
        ),
    );
  }
}
