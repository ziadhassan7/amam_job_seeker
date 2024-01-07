//---
import 'package:amam_job_seeker_assessment/features/profile/data/model/profile_model_data.dart';

class ProfileModel {
  String? status;
  ProfileModelData? data;

  ProfileModel({this.status, this.data,});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? ProfileModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}