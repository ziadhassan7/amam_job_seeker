import 'package:amam_job_seeker_assessment/features/weather/presentation/widgets/weather_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../../data/model/weather_model.dart';
import '../../manager/controllers/weather_controller.dart';
import 'base_weather_widget.dart';


class InfoWeather extends ConsumerWidget {
  const InfoWeather({super.key, required this.data});

  final Position data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return FutureBuilder<WeatherModel?>(
        future: WeatherController.getCurrentWeather(data),

        builder: (context, AsyncSnapshot snapshot){

          if(snapshot.hasData){

            //weather
            WeatherModel weather = snapshot.data;
            //temp , condition , city
            String? temp = weather.main?.temp.toString();
            String? condition = weather.weather?.first.main;
            String? city = weather.name;

            return BaseWeatherWidget(
              asset: getWeatherIcon(condition),
              text: temp,
              city: city,
            );

          } else {

            return const WeatherLoading();
          }
        }
    );
  }


  String getWeatherIcon(String? condition){
    switch(condition){

      case "Rain":
        return "assets/weather/rain.svg";
      case "Drizzle":
        return "assets/weather/drizzle.svg";
      case "Clear":
        return "assets/weather/clear.svg";
      case "Snow":
        return "assets/weather/snow.svg";
      case "Thunderstorm":
        return "assets/weather/thunderstorm.svg";
      case "Clouds":
        return "assets/weather/clouds.svg";

      default:
        return "assets/weather/clouds.svg";
    }
  }

}
