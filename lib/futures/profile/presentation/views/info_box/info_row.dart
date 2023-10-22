import 'package:flutter/material.dart';
import '../../widgets/data_info.dart';
import '../../widgets/data_title.dart';

class InfoRow extends StatelessWidget {
  const InfoRow(this.title, this.value, {super.key});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment.topLeft,
                child: DataTitle(title))),

        Expanded(
            flex: 4,
            child: Align(
                alignment: Alignment.topLeft,
                child: DataInfo(value)))
      ],
    );
  }
}
