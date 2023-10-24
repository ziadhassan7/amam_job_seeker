import 'package:flutter/material.dart';
import '../../../../core/styles/padding.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: CustomPadding(horizontal: 10),

        child: SizedBox(
            width: 10,
            height: 10,
            child: CircularProgressIndicator(strokeWidth: 3,)
        )
    );
  }
}
