import 'package:flutter/material.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../app_common_widgets/custom_button.dart';
import '../../../../app_common_widgets/text_view.dart';

class TopBarNotSigned extends StatelessWidget {
  const TopBarNotSigned({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
            onPressed: () {},
            child: const TextView(
              "Log in",
              color: AppColor.accentDarker,
              weight: FontWeight.bold,
            )),

        const CustomButton(label: "Get Started", isBig: true, height: 14,)
      ],
    );
  }
}
