import 'package:amam_job_seeker_assessment/core/firebase/constants/firebase_const.dart';

class UserModel {

  UserModel({required this.cvRef});

  String cvRef;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(cvRef: map[firebase_item_cv]);
  }

  Map<String, dynamic> toMap() {

    return {
      firebase_item_cv: cvRef
    };
  }
}
