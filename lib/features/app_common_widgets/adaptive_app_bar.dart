import 'package:amam_job_seeker_assessment/core/styles/app_screen.dart';
import 'package:amam_job_seeker_assessment/core/styles/box_decoration.dart';
import 'package:amam_job_seeker_assessment/core/styles/padding.dart';
import 'package:amam_job_seeker_assessment/features/app_common_widgets/text_view/text_view.dart';
import 'package:flutter/material.dart';

class AdaptiveAppBar{
  const AdaptiveAppBar(this.context, {required this.title, this.leadingFunction});

  final BuildContext context;
  final String title;
  final Function()? leadingFunction;

  static double _scale = 1;
  static const double _fixedHeight = 60;

  PreferredSizeWidget getWidget(){
    final screenWidth = AppScreen(context).width;
    final screenHeight = AppScreen(context).height;

    //Get Adaptive
    if(isDesktop(screenWidth, screenHeight)){
      _scale = 1.4;
      return desktopAppBar(context);

    } else {
      _scale = 1;
      return mobileAppBar(context);
    }
  }

  //Decide adaptive layout
  bool isDesktop(double screenWidth, double screenHeight){
    return (screenWidth > 600 && screenHeight > 400);
  }

  ///Layouts
  //Get Mobile layout
  AppBar mobileAppBar(BuildContext context){
    return customAppBar(
      context,
      leadingWidget: mobileLeadingWidget(),
    );
  }

  //Get Desktop Layout
  AppBar desktopAppBar(BuildContext context){
    return customAppBar(
      context,
      leadingWidget: desktopLeadingWidget(),
    );
  }


  ///Widgets
  //desktop leading widget
  Widget desktopLeadingWidget(){
    return Container(
      padding: const CustomPadding(vertical: 14, horizontal: 18),

      decoration: CustomDecoration(
        radius: 14,
        borderWidth: 1, borderColor: Colors.black,
      ),

      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.close_rounded),

          SizedBox(width: 10,),

          TextView("Cancel", size: 14,)
        ],),
    );
  }

  //mobile leading widget
  Widget mobileLeadingWidget() => const Icon(Icons.close_rounded);

  ///View
  //Your app bar widget
  AppBar customAppBar(BuildContext context, {required Widget leadingWidget,}){
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: _fixedHeight*_scale,

      flexibleSpace: SafeArea(
        child: SizedBox(
          height: _fixedHeight*_scale,

          child: Row(
            children: [
              //back button
              Padding(
                padding: const CustomPadding(horizontal: 40),
                child: InkWell(
                    onTap: leadingFunction ?? ()=> Navigator.pop(context),
                    child: leadingWidget),
              ),

              //Title
              TextView(title, weight: FontWeight.bold, size: 18*_scale,)
            ],
          ),
        ),
      ),
    );
  }

}
