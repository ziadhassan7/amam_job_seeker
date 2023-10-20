import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/core/styles/app_colors.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app_common_widgets/custom_button.dart';
import '../manager/resume_controller.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key, this.isChange = false});

  final bool isChange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Center(
          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                // Cv - illustration
                SvgPicture.asset("assets/resume_ill.svg"),

                spaceAlignment(),

                // Upload Cv - btn
                CustomButton(
                  label: "Upload CV",
                  onPressed: () async {
                    await ResumeController.pickFileAndUploadCv();
                  },
                ),

                const LinearProgressIndicator(color: AppColor.accent,),

                const TextView("Error Occurred", color: Colors.red,),

                // Info Text
                const TextView("Only accepts pdf files"),

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
        ),
      ),
    );
  }

  spaceAlignment() => const SizedBox(height: 20,);
}
