import 'package:flutter/material.dart';
import '../../widgets/data_info.dart';
import '../../widgets/data_title.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key, required this.titles, required this.values});

  final List<String> titles;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            for(String title in titles)
            DataTitle(title),
          ],
        ),


        const SizedBox(width: 20,),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            for(String value in values)
            DataInfo(value),
          ],
        )

      ],
    );
  }
}
