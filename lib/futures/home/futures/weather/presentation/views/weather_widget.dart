import 'package:amam_job_seeker_assessment/core/firebase/firebase_auth/auth.dart';
import 'package:amam_job_seeker_assessment/futures/home/futures/weather/presentation/views/sub/info_weather.dart';
import 'package:amam_job_seeker_assessment/futures/home/futures/weather/presentation/views/sub/stamp_weather.dart';
import 'package:amam_job_seeker_assessment/futures/profile/data/repository/profile_repo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {

    String userId = "null";

    //get user id
    if(Auth().currentUser != null){
      userId = Auth().currentUser!.uid;
    }

    return StreamBuilder<DatabaseEvent>(
      stream: ProfileRepo.getStreamProfile(userId),

      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {

        if(snapshot.hasData){
          Object? mainData = snapshot.data!.snapshot.value;
          if(mainData != null){

            return InfoWeather(data: mainData);

          } else {
            return const StampWeather();
          }
        } else {
          return const StampWeather();
        }
      }
    );
  }
}
