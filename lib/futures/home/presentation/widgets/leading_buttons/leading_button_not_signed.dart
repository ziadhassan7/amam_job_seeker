import 'package:flutter/material.dart';
import '../../../../app_common_widgets/custom_button.dart';
import '../../../../app_common_widgets/text_view.dart';

class LeadingButtonsNotSigned extends StatelessWidget {
  const LeadingButtonsNotSigned({super.key, this.scale = 1});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(label: "Create Account", isBig: true, textSize: 20*(scale*0.7), width: 30*scale, height: 18*scale,),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextView("Already have an account"),

            TextButton(onPressed: (){

            },
              child: const TextView("Sign in"),)
          ],
        )
      ],
    );
  }

}
