import 'package:amam_job_seeker_assessment/core/styles/app_screen.dart';
import 'package:amam_job_seeker_assessment/core/styles/padding.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/widgets/illustration_widget.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/widgets/leading_text.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/widgets/responsive_space.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/widgets/show_on_logged.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/widgets/top_bar/top_bar_not_signed.dart';
import 'package:flutter/material.dart';
import '../widgets/leading_buttons/leading_button_not_signed.dart';
import '../widgets/leading_buttons/leading_button_signed.dart';
import '../widgets/top_bar/top_bar_signed.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = AppScreen(context).width;
    double screenHeight = AppScreen(context).height;

    return Stack(
      fit: StackFit.expand,

      children: [
        Positioned(
            right: 0, bottom: -100,
            child: IllustrationWidget(height: screenHeight*0.8,)),

        SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,


            children: [
              const ShowOnLogged(
                  loggedWidget: TopBarSigned(),
                  notLoggedWidget: TopBarNotSigned()),

              const ResponsiveSpace(),

              //Looking for a Job? We will get you hired
              Padding(
                padding: CustomPadding(horizontal: screenWidth*0.1),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    LeadingText(scale: 1.5,),

                    ResponsiveSpace(),

                    //Create Account / View Profile
                    ShowOnLogged(
                      loggedWidget: LeadingButtonsSigned(scale: 1.2,),
                      notLoggedWidget: LeadingButtonsNotSigned(scale: 1.2,),),
                  ],
                ),
              ),

              const ResponsiveSpace(),

            ],
          ),
        ),
      ],
    );
  }
}
