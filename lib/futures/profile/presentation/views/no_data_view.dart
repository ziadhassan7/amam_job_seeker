import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/pages/resume_page.dart';
import 'package:flutter/material.dart';
import '../../../app_common_widgets/text_view/text_view.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key,});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //
        const TextView("No Data Provided"),


        // Upload another CV
        TextButton(
          child: const TextView("Try uploading another CV"),

          onPressed: ()=> AppRouter.navigateTo(context, const ResumePage()),
        ),
      ],
    );
  }
}
