import 'package:amam_job_seeker_assessment/core/styles/padding.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_screen.dart';
import 'box_decoration.dart';

class AdaptiveContainer extends StatelessWidget {
  const AdaptiveContainer(
      {super.key, required this.maxWidth, required this.child});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,

      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 18,

          child: Container(
            padding: const CustomPadding(vertical: 18, horizontal: 20),
            decoration: CustomDecoration(radius: 18, backgroundColor: Colors.white,),
            width: null,
            height: getHeight(context),

            child: SizedBox(width: maxWidth, child: child),
          ),
        ),
      ),
    );
  }

  double? getHeight(BuildContext context){
    final screenWidth = AppScreen(context).width;

    return (screenWidth > 400)
        ? null //wrap
        : double.infinity; //full screen
  }
}
