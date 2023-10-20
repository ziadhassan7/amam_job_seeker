import 'package:amam_job_seeker_assessment/futures/home/presentation/widgets/leading_buttons/leading_button_not_signed.dart';
import 'package:amam_job_seeker_assessment/futures/home/presentation/widgets/leading_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/app_screen.dart';
import '../widgets/illustration_widget.dart';
import '../widgets/responsive_space.dart';
import '../widgets/show_on_logged.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = AppScreen(context).width;
    double screenHeight = AppScreen(context).height;

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [

        Positioned(
          bottom: -100,
          child: IllustrationWidget(width: screenWidth*0.7,),
        ),

        const SingleChildScrollView(
          child: Column(
            children: [

              ResponsiveSpace(),

              //Looking for a Job? We will get you hired
              LeadingText(),

              SizedBox(height: 40,),
              ResponsiveSpace(),

              //Create Account / View Profile
              ShowOnLogged(
                  loggedWidget: LeadingButtonsNotSigned(),
                  notLoggedWidget: LeadingButtonsNotSigned()),

            ],
          ),
        ),
      ],
    );
  }

}
