import 'package:flutter/material.dart';
import '../dialog/no_weather_dialog.dart';
import 'base_weather_widget.dart';

class StampWeather extends StatelessWidget {
  const StampWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
        StreakInfoDialog(context);
      },

      child: const BaseWeatherWidget(
          asset: "assets/weather/clouds.svg",
        ),
    );
  }
}
