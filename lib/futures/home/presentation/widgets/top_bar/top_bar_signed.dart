import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/manager/controller/auth_conroller.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class TopBarSigned extends StatelessWidget {
  const TopBarSigned({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        
        TextButton(
          child: const TextView("Sign Out"),

          onPressed: (){
            AuthController.logout();
            AppRouter.navigateTo(context, const HomePage(), isReplace: true);
          },
        )
      ],
    );
  }
}
