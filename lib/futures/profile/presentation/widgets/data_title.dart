import 'package:flutter/material.dart';
import '../../../../core/styles/padding.dart';
import '../../../app_common_widgets/text_view/text_view.dart';

class DataTitle extends StatelessWidget {
  const DataTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(bottom: 18),

      child: TextView(
        title,
        size: 14,
        weight: FontWeight.bold,
        fontFamily: FontFamily.roboto,
        color: Colors.black45,
      ),
    );
  }
}
