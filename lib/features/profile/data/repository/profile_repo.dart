import 'dart:convert';
import 'package:amam_job_seeker_assessment/features/profile/data/model/profile_model.dart';
import 'package:amam_job_seeker_assessment/features/profile/data/model/profile_model_data.dart';
import '../../../../core/firebase/real_time/database_client.dart';

enum ProfileException {
  noData,
}

class ProfileRepo {

  ///Add
  static addProfile(Map data, String userId){
    DatabaseClient.add(jsonEncode(data), dataPath: "$userId/jsonData");
  }

  ///Get
  //get once
  static Future<Object> getProfile(String userId) async {

    final data=  await DatabaseClient.getOnce(dataPath: "$userId/jsonData");

    if(data != null){
      return data;

    } else {
      return ProfileException.noData; //differentiate between null values and future loading (because null => loading)
    }
  }

  //get data from model
  static ProfileModelData? getProfileData(Object data){
    ProfileModel model = ProfileModel.fromJson(jsonDecode(data.toString()));

    //Get data from results
    ProfileModelData? profileData = model.data;
    return profileData;
  }

  //get stream
  static getStreamProfile(String userId) {
    return DatabaseClient.getRealTime(dataPath: "$userId/jsonData");
  }

}