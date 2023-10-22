import 'package:flutter/material.dart';
import '../../../../app_common_widgets/custom_button.dart';
import '../../../../app_common_widgets/text_view/text_view.dart';

class LeadingButton extends StatelessWidget {
  final double scale;
  //
  final String leadingButtonTitle;
  final Function()? leadingButtonFunction;
  //
  final String subText;
  final String subButtonTitle;
  final Function()? subButtonFunction;

  const LeadingButton({super.key,
    this.scale = 1,
    //
    required this.leadingButtonTitle,
    required this.leadingButtonFunction,
    //
    required this.subText,
    required this.subButtonTitle,
    required this.subButtonFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          label: leadingButtonTitle,
          isBig: true,
          textSize: 20 * (scale * 0.7),
          width: 30 * scale,
          height: 18 * scale,

          onPressed: leadingButtonFunction,
        ),


        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextView(subText),

            TextButton(
              onPressed: subButtonFunction,
              child: TextView(subButtonTitle),
            )
          ],
        )
      ],
    );
  }
}
