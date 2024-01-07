import 'package:amam_job_seeker_assessment/features/profile/presentation/pages/profile_page.dart';
import 'package:amam_job_seeker_assessment/features/resume/presentation/pages/resume_page.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app_router.dart';
import 'leading_button.dart';

class LeadingButtonsSigned extends StatelessWidget {
  const LeadingButtonsSigned({super.key, this.scale =1});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return LeadingButton(
      scale: scale,
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
