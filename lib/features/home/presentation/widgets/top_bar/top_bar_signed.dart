import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/core/styles/padding.dart';
import 'package:amam_job_seeker_assessment/features/app_common_widgets/text_view/text_view.dart';
import 'package:amam_job_seeker_assessment/features/auth/presentation/manager/controller/auth_conroller.dart';
import 'package:amam_job_seeker_assessment/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../../../weather/presentation/views/weather_widget.dart';

class TopBarSigned extends StatelessWidget {
  const TopBarSigned({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding(horizontal: 8, vertical: 8),

      child: Row(
        children: [

          const WeatherWidget(),

          const Spacer(),

          TextButton(
            child: const TextView("Sign Out"),

            onPressed: (){
              AuthController.logout();
              AppRouter.navigateTo(context, const HomePage(), isReplace: true);
            },
          )
        ],
      ),
    );
  }
}
