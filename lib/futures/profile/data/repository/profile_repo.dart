import 'dart:convert';
import 'package:amam_job_seeker_assessment/futures/profile/data/model/profile_model.dart';
import 'package:amam_job_seeker_assessment/futures/profile/data/model/profile_model_data.dart';
import '../../../../core/firebase/real_time/database_client.dart';

enum ProfileException {
  noData,
}

class ProfileRepo {

  static addProfile(Map data, String userId){
    DatabaseClient.add(jsonEncode(data), dataPath: "$userId/jsonData");
  }

  static Future<Object> getProfile(String userId) async {

    final data=  await DatabaseClient.getOnce(dataPath: "$userId/jsonData");

    if(data != null){
      return data;

    } else {
      return ProfileException.noData;
    }
  }

  static getProfileData(Object data){
    ProfileModel model = ProfileModel.fromJson(jsonDecode(data.toString()));

    //Get data from results
    ProfileModelData? profileData = model.data;
    return profileData;
  }


}