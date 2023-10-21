import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/core/styles/adaptive_container.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/pages/home_page.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/manager/state_manager/upload_loading_provider.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/widgets/error_status_message.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/styles/adaptive_app_bar.dart';
import '../../../app_common_widgets/custom_button.dart';
import '../manager/controller/resume_controller.dart';
import '../manager/state_manager/upload_failed_provider.dart';

class ResumePage extends ConsumerWidget {
  const ResumePage({super.key, this.isChange = false});

  final bool isChange;

  static const double _maxWidth = 400;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        //close old error messages
                        resetErrorMessage(ref);

                        //start loading
                        triggerLoading(ref);

                        await ResumeController(ref).pickFileAndUploadCv().
                          //if task is finished close loading widget
                          then((value) => finishLoading(ref));
                      },
                    ),

                    // Info Text
                    const TextView("Only accepts pdf files", color: Colors.black45, size: 10,),

                    smallAlignmentSpace(),

                    const LoadingWidget(),

                    smallAlignmentSpace(),

                    const ErrorStatusMessage(),
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

                    child: TextButton(
                      child: const TextView("Cancel", color: Colors.black,),
                      onPressed: () {
                        resetErrorMessage(ref);
                        Navigator.pop(context);
                      },
                    )),

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

  //Widgets
  alignmentSpace() => const SizedBox(height: 40,);
  smallAlignmentSpace() => const SizedBox(height: 20,);


  //Functions
  void resetErrorMessage(WidgetRef ref){
    ref.read(uploadFailedProvider.notifier).hide();
  }

  void triggerLoading(WidgetRef ref){
    ref.read(uploadLoadingProvider.notifier).loading();
  }

  void finishLoading(WidgetRef ref){
    ref.read(uploadLoadingProvider.notifier).done();
  }
}
