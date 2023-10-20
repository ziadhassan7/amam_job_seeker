import 'package:amam_job_seeker_assessment/futures/profile/presentation/pages/profile_page.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/pages/resume_page.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app_router.dart';
import 'leading_button.dart';

class LeadingButtonSigned extends StatelessWidget {
  const LeadingButtonSigned({super.key});

  @override
  Widget build(BuildContext context) {
    return LeadingButton(
      leadingButtonTitle: "View Profile",
      leadingButtonFunction: (){
        AppRouter.navigateTo(context, const ProfilePage()); //go to user Profile
      },

      subText: "Or",
      subButtonTitle: "Upload a new CV",
      subButtonFunction: (){
        AppRouter.navigateTo(context, const ResumePage(isChange: true,)); //go to Login screen
      },
    );
  }
}
