import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/pages/resume_page.dart';
import 'package:flutter/material.dart';
import '../../../../app_common_widgets/dialoq_widget.dart';
import '../../../../app_common_widgets/text_view/text_view.dart';

class StreakInfoDialog {


  StreakInfoDialog(BuildContext context){
    DialogWidget.info(
      context,

      child: view(context),
    );
  }

  Widget view(BuildContext context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        const TextView(
          "There is no city address\nIn your profile..",
          size: 16,
        ),

        const SizedBox(height: 18,),

        TextButton(
          child: const TextView("Try uploading another CV"),

          onPressed: (){
            AppRouter.navigateTo(context, const ResumePage());
          }, ),

        const SizedBox(height: 18,),
      ],
    );
  }

}
