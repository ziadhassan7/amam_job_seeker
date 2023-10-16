import 'package:amam_job_seeker_assessment/core/styles/app_colors.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double? textSize;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final Function()? onPressed;

  const CustomButton(
      {super.key,
      required this.label,
      this.textSize,
      this.style,
      this.backgroundColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),

      child: ElevatedButton(
        style: style ?? ButtonStyle(backgroundColor: MaterialStateProperty.all(
                    backgroundColor ?? AppColor.accent)),

        onPressed: onPressed,

        child: TextView(
          label,
          size: textSize,
          weight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
