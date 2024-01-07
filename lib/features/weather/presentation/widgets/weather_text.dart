import 'package:flutter/material.dart';
import '../../../app_common_widgets/text_view/text_view.dart';

class WeatherText extends StatelessWidget {
  static const String _defaultText = "Weather Today";

  const WeatherText({
    super.key,
    this.text,
    this.city,
    this.scale = 1,
  });

  final String? text;
  final String? city;
  final double scale;

  @override
  Widget build(BuildContext context) {


    return TextView(getText(), size: 12*scale, weight: FontWeight.w600,);
  }


  String getText(){
    if(text == null){
      return _defaultText;
    }

    if(city != null) {
      return "$text°C  |  In $city";

    } else {
      return "$text°C";
    }
  }
}
