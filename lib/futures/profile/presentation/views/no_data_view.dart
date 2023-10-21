import 'package:flutter/material.dart';
import '../../../app_common_widgets/text_view.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextView("No Data Provided");
  }
}
