import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/features/auth/presentation/pages/login_page.dart';
import 'package:amam_job_seeker_assessment/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../app_common_widgets/custom_button.dart';
import '../../../../app_common_widgets/text_view/text_view.dart';

class TopBarNotSigned extends StatelessWidget {
  const TopBarNotSigned({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          child: const TextView(
            "Log in",
            color: AppColor.accentDarker,
            weight: FontWeight.bold,
          ),

          onPressed: (){
            AppRouter.navigateTo(context, const LoginPage());
          },
        ),

        CustomButton(
          label: "Get Started", isBig: true, height: 14,

          onPressed: (){
            AppRouter.navigateTo(context, const RegisterPage());
          },
        )
      ],
    );
  }
}
