import 'package:amam_job_seeker_assessment/futures/home/futures/weather/data/model/weather_model.dart';
import 'package:amam_job_seeker_assessment/futures/home/futures/weather/presentation/manager/weather_controller.dart';
import 'package:amam_job_seeker_assessment/futures/home/futures/weather/presentation/views/sub/stamp_weather.dart';
import 'package:amam_job_seeker_assessment/futures/profile/data/model/profile_model_data.dart';
import 'package:flutter/material.dart';
import '../../../../../../profile/data/repository/profile_repo.dart';
import 'base_weather_widget.dart';


class InfoWeather extends StatelessWidget {
  const InfoWeather({super.key, required this.data});

  final Object data;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: WeatherController.getCurrentWeather(data),

        builder: (context, AsyncSnapshot snapshot){

          if(snapshot.hasData){
            //weather
            WeatherModel weather = snapshot.data;
            //temp , condition
            String? temp = weather.main?.temp.toString();
            String? condition = weather.weather?.first.main;

            return BaseWeatherWidget(
              asset: getWeatherIcon(condition),
              text: temp,
              city: getCity(data),
            );

          } else {

            return const StampWeather();
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


  String? getCity(Object data){
    final ProfileModelData? userInfo = ProfileRepo.getProfileData(data);

    String? city = userInfo?.address?.city;

    if(city != null) {
      return city;
    }

    return null;
  }

}
