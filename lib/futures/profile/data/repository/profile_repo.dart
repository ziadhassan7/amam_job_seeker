import 'dart:convert';
import 'package:amam_job_seeker_assessment/futures/profile/data/model/profile_model.dart';
import '../../../../core/firebase/real_time/database_client.dart';

class ProfileRepo {

  static addProfile(Map data, String userId){
    DatabaseClient.add(jsonEncode(data), dataPath: "$userId/jsonData");
  }

  static Future<ProfileModel?> getProfile(String userId) async {

    final data=  await DatabaseClient.getOnce(dataPath: "$userId/jsonData");

    if(data != null){
      ProfileModel model = ProfileModel.fromJson(jsonDecode(data.toString()));
      return model;
    }

    return null;
  }

}