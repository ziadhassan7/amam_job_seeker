import 'package:amam_job_seeker_assessment/core/styles/app_screen.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:flutter/material.dart';
import '../../../../core/firebase/firebase_auth/auth.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/padding.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = Auth().displayName;
    String userEmail = Auth().userEmail;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.accentBackground,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColor.accentDark,
          size: 20,
        ),
        title: const TextView("Your Profile", color: AppColor.accentDark,),),


      body: SafeArea(

        child: Padding(
          padding: const CustomPadding(vertical: 18, horizontal: 20),

          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customDivider(BuildContext context){
    return Expanded(
      child: Container(color: Colors.black12,
        width: AppScreen(context).width/3, height: 1,),
    );
  }

  static Widget _alignmentSpace({bool isBig= false}){
    return SizedBox(height: isBig ? 40 : 20,);
  }
}
