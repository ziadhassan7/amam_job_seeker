import 'package:flutter/material.dart';

import '../../../app_common_widgets/custom_button.dart';
import '../manager/resume_controller.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          children: [
            CustomButton(
              label: "Fill automatically with your CV",
              onPressed: () async {
                await ResumeController.pickFileAndUploadCv();
              },
            ),
          ],
        ),
      ),
    );
  }
}
