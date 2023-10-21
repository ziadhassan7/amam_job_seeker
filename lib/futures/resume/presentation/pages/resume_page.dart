import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/core/styles/adaptive_container.dart';
import 'package:amam_job_seeker_assessment/core/styles/app_colors.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/styles/adaptive_app_bar.dart';
import '../../../app_common_widgets/custom_button.dart';
import '../manager/resume_controller.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key, this.isChange = false});

  final bool isChange;

  static const double _maxWidth = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(context, title: "Upload your CV",).getWidget(),

      body: AdaptiveContainer(
        maxWidth: _maxWidth,

        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [

                    alignmentSpace(),

                    // Cv - illustration
                    SvgPicture.asset("assets/resume_ill.svg"),

                    alignmentSpace(),

                    // Upload Cv - btn
                    CustomButton(
                      isBig: true,
                      width: 45,
                      label: "Upload CV",
                      onPressed: () async {
                        await ResumeController.pickFileAndUploadCv();
                      },
                    ),

                    // Info Text
                    const TextView("Only accepts pdf files", color: Colors.black45, size: 10,),

                    smallAlignmentSpace(),

                    const LinearProgressIndicator(color: AppColor.accent,),

                    smallAlignmentSpace(),

                    const TextView("Error Occurred", color: Colors.red,),
                  ],
                ),
              ),
            ),

            Row(
              children: [
                const Spacer(),

                TextButton(
                    onPressed: (){
                      AppRouter.navigateTo(context, const HomePage());
                    },

                    child: const TextView("Cancel", color: Colors.black45,)),

                const CustomButton(
                  label: "Next",
                  onPressed: null,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  alignmentSpace() => const SizedBox(height: 40,);
  smallAlignmentSpace() => const SizedBox(height: 20,);
}
