import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/pages/login_page.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/pages/register_page.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/widgets/leading_buttons/leading_button.dart';
import 'package:flutter/material.dart';

class LeadingButtonsNotSigned extends StatelessWidget {
  const LeadingButtonsNotSigned({super.key, this.scale = 1});

  final double scale;

  @override
  Widget build(BuildContext context) {
    return LeadingButton(
      leadingButtonTitle: "Create Account",
      leadingButtonFunction: (){
        AppRouter.navigateTo(context, const RegisterPage()); //go to SignUp screen
      },

      subText: "Already have an account",
      subButtonTitle: "Sign in",
      subButtonFunction: (){
        AppRouter.navigateTo(context, const LoginPage()); //go to Login screen
      },
    );
  }

}
