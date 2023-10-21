import 'package:amam_job_seeker_assessment/core/styles/adaptive_container.dart';
import 'package:amam_job_seeker_assessment/core/styles/app_screen.dart';
import 'package:amam_job_seeker_assessment/futures/profile/data/model/profile_model.dart';
import 'package:amam_job_seeker_assessment/futures/profile/data/repository/profile_repo.dart';
import 'package:amam_job_seeker_assessment/futures/profile/presentation/views/no_data_view.dart';
import 'package:amam_job_seeker_assessment/futures/profile/presentation/views/user_info_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/firebase/firebase_auth/auth.dart';
import '../../../../core/styles/adaptive_app_bar.dart';
import '../../../../core/styles/padding.dart';
import '../../data/model/profile_model_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const double _maxWidth = 700;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AdaptiveAppBar(context, title: "Your Profile",).getWidget(),


      body: AdaptiveContainer(
        maxWidth: _maxWidth,

        child: Padding(
          padding: const CustomPadding(vertical: 18, horizontal: 20),

          child: SingleChildScrollView(
            child: Center(

              child: FutureBuilder(
                future: getUserData(),
                builder: (context, AsyncSnapshot snapshot) {

                  if(snapshot.hasData){

                    final ProfileModel data = snapshot.data!;
                    final ProfileModelData? userInfo = data.data;

                    if(userInfo != null) {
                      return UserInfoView(data: userInfo,);

                    } else {
                      return const NoDataView();
                    }


                  } else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
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


  Future<ProfileModel?> getUserData() async {

    User? user = Auth().currentUser;

    if(user != null){
      return await ProfileRepo.getProfile(user.uid);
    }

    return null;
  }

}
