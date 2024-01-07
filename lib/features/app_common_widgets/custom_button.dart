import 'package:amam_job_seeker_assessment/core/styles/app_colors.dart';
import 'package:amam_job_seeker_assessment/core/styles/padding.dart';
import 'package:amam_job_seeker_assessment/features/app_common_widgets/text_view/text_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? textSize;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final Function()? onPressed;
  final bool isBig;
  final double? width;
  final double? height;

  const CustomButton(
      {super.key,
      required this.label,
      this.textSize,
      this.style,
      this.backgroundColor = AppColor.accent,
      this.onPressed,
      this.isBig = false,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding(horizontal: 15, vertical: isBig ? 14:8),

      child: ElevatedButton(
        style: getStyle(),

        onPressed: onPressed,

        child: Padding(
          padding: CustomPadding(vertical: height??12, horizontal: width),

          child: TextView(
            label,
            size: textSize,
            weight: isBig ? FontWeight.bold:FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }


  getStyle(){
    if(onPressed != null){
      return style ?? ButtonStyle(backgroundColor: MaterialStateProperty.all(
          backgroundColor));

    } else {
      return style;
    }
  }
}
