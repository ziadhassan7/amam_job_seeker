import 'package:amam_job_seeker_assessment/core/styles/adaptive_container.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/pages/login_page.dart';
import 'package:amam_job_seeker_assessment/futures/profile/data/repository/profile_repo.dart';
import 'package:amam_job_seeker_assessment/futures/profile/presentation/views/no_data_view.dart';
import 'package:amam_job_seeker_assessment/futures/profile/presentation/views/profile_data_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_router.dart';
import '../../../../core/firebase/firebase_auth/auth.dart';
import '../../../../core/styles/adaptive_app_bar.dart';
import '../../../../core/styles/padding.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../data/model/profile_model_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const double _maxWidth = 700;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AdaptiveAppBar(
          context,
          title: "Your Profile",
          leadingFunction: () => AppRouter.navigateTo(context, const HomePage(), isReplace: true)
      ).getWidget(),


      body: AdaptiveContainer(
        maxWidth: _maxWidth,

        child: Padding(
          padding: const CustomPadding(vertical: 18, horizontal: 20),

          child: SingleChildScrollView(
            child: Center(

              child: FutureBuilder(
                future: getUserData(context),
                builder: (context, AsyncSnapshot snapshot) {

                  if(snapshot.hasData){

                    Object data = snapshot.data;

                    if(data != ProfileException.noData ){

                      final ProfileModelData? userInfo = ProfileRepo.getProfileData(data);


                      if(userInfo != null){
                        return ProfileDataView(data: userInfo,);

                      } else {
                        return const NoDataView();
                      }


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


  // get user profile from database
  Future<Object?> getUserData(BuildContext context) async {

    User? user = Auth().currentUser;

    if(user != null){
      return await ProfileRepo.getProfile(user.uid);
    }

    AppRouter.navigateTo(context, const LoginPage());
    return null;
  }

}
