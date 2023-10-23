import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view/text_view.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/pages/home_page.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/manager/controller/upload_status_controller.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/widgets/bottom_navigation_buttons.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/widgets/error_status_message.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../app_common_widgets/adaptive_app_bar.dart';
import '../../../app_common_widgets/adaptive_container.dart';
import '../../../app_common_widgets/custom_button.dart';
import '../manager/controller/resume_controller.dart';
import '../widgets/success_message.dart';

class ResumePage extends ConsumerWidget {
  const ResumePage({super.key, this.isChange = false});

  final bool isChange;

  static const double _maxWidth = 400;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AdaptiveAppBar(
          context,
          title: "Upload your CV",
          leadingFunction: () => AppRouter.navigateTo(context, const HomePage(), isReplace: true)
      ).getWidget(),


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
                        //close old error messages
                        UploadStatusController.resetErrorMessage(ref);

                        await ResumeController(ref).pickFileAndUploadCv();
                      },
                    ),

                    // Info Text
                    const TextView("Only accepts pdf files", color: Colors.black45, size: 10,),

                    smallAlignmentSpace(),

                    const LoadingWidget(),

                    smallAlignmentSpace(),

                    const ErrorStatusMessage(),
                    const SuccessMessage(),
                  ],
                ),
              ),
            ),

            const BottomNavigationButtons(),
          ],
        ),
      ),
    );
  }

  //Widgets
  alignmentSpace() => const SizedBox(height: 40,);
  smallAlignmentSpace() => const SizedBox(height: 20,);

}
