import 'package:amam_job_seeker_assessment/core/styles/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/weather_text.dart';

class BaseWeatherWidget extends StatelessWidget {
  const BaseWeatherWidget({super.key, required this.asset, this.text, this.city});

  final String asset;
  final String? text;
  final String? city;

  @override
  Widget build(BuildContext context) {
    double screenWidth = AppScreen(context).width;

    return Row(
      children: [
        const SizedBox(width: 10,),

        SvgPicture.asset(asset, width: 18*getScale(screenWidth),),

        const SizedBox(width: 10,),

        WeatherText(text: text, city: city, scale: getScale(screenWidth),),
      ],
    );
  }


  double getScale(double screenWidth){
    if(screenWidth < 400) {
      return 1;

    } else if (screenWidth > 400 && screenWidth < 1000) {
      return 1.1;

    } else {
      return 1.2;
    }
  }
}
