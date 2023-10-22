import 'package:flutter/material.dart';
import '../../../../core/styles/padding.dart';
import '../../../app_common_widgets/text_view.dart';

class BoxTitle extends StatelessWidget {
  const BoxTitle(this.title, {super.key,});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(vertical: 28),

      child: TextView(title, size: 18, weight: FontWeight.bold, fontFamily: FontFamily.roboto,),
    );
  }
}
