import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class IllustrationWidget extends StatelessWidget {
  const IllustrationWidget({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      height: height, width: width,

      "assets/resume_home_ill.svg",
    );
  }
}
