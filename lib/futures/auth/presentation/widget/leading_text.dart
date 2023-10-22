import 'package:flutter/material.dart';
import '../../../../core/styles/padding.dart';
import '../../../app_common_widgets/text_view/text_view.dart';

class LeadingText extends StatelessWidget {
  const LeadingText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 40),
      child: TextView(title, weight: FontWeight.bold, size: 32,),
    );
  }
}
