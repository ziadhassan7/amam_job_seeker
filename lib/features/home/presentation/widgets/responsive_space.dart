import 'package:amam_job_seeker_assessment/core/styles/app_screen.dart';
import 'package:flutter/material.dart';

class ResponsiveSpace extends StatelessWidget {
  const ResponsiveSpace({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = AppScreen(context).height;

    return SizedBox(height: screenHeight * 0.2,);
  }
}
