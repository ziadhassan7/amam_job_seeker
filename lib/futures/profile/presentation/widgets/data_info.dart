import 'package:flutter/material.dart';
import '../../../../core/styles/padding.dart';
import '../../../app_common_widgets/text_view/text_view.dart';

class DataInfo extends StatelessWidget {
  const DataInfo(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(bottom: 18),

      child: TextView(
        text,
        size: 14,
        weight: FontWeight.bold,
        fontFamily: FontFamily.roboto,
      ),
    );
  }
}
