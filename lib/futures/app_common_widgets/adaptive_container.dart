import 'package:amam_job_seeker_assessment/core/styles/padding.dart';
import 'package:flutter/material.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_screen.dart';
import '../../core/styles/box_decoration.dart';

class AdaptiveContainer extends StatelessWidget {
  const AdaptiveContainer(
      {super.key, required this.maxWidth, required this.child});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,

      child: Padding(
        padding: CustomPadding(top: getAdaptivePadding(context)),

        child: Center(
          child: Material(
            borderRadius: BorderRadius.circular(18),
            elevation: 18,

            child: Container(
              padding: const CustomPadding(vertical: 18, horizontal: 20),
              decoration: CustomDecoration(radius: 18, backgroundColor: Colors.white,),
              width: getWidth(context),
              height: getHeight(context),

              child: SizedBox(width: maxWidth, child: child),
            ),
          ),
        ),
      ),
    );
  }

  double? getWidth(BuildContext context){
    final screenHeight = AppScreen(context).height;

    return (screenHeight > 400)
        ? null //wrap
        : double.infinity; //full screen
  }

  double? getHeight(BuildContext context){
    final screenWidth = AppScreen(context).width;

    return (screenWidth > 400)
        ? null //wrap
        : double.infinity; //full screen
  }

  double getAdaptivePadding(BuildContext context){
    final screenWidth = AppScreen(context).width;
    final screenHeight = AppScreen(context).height;

    if(screenWidth > 400 && screenHeight > 400){
      return 20;
    }

    return 0;
  }
}
