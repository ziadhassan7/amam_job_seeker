import 'package:flutter/material.dart';
import '../../../app_common_widgets/text_view.dart';

class LeadingText extends StatelessWidget {
  const LeadingText({super.key, this.scale = 1});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        TextView("Looking For a Job?", size: 36 * scale, weight: FontWeight.bold,),
        TextView("We will get you hired!", size: 18 * scale),
      ],
    );
  }
}
