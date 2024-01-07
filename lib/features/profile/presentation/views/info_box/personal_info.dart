import 'package:amam_job_seeker_assessment/features/profile/presentation/views/info_box/info_row.dart';
import 'package:amam_job_seeker_assessment/features/profile/presentation/widgets/box_title.dart';
import 'package:flutter/material.dart';
import '../../../data/model/profile_model_data.dart';

class PersonalInfoBox extends StatelessWidget {
  const PersonalInfoBox({super.key, required this.data});

  final ProfileModelData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const BoxTitle("Personal Info"),


        InfoRow("Full Name", getFullName()),
        InfoRow("Email", getEmail()),
        InfoRow("Phone", getPhone()),
        InfoRow("City", getCity()),

      ],
    );
  }

  String getFullName(){
    if(data.name != null) {
      return data.name!.fullName ?? "No data provided";
    }

    return "No data provided";
  }

  String getEmail(){
    if(data.email != null) {
      return data.email!.first.email ?? "--";
    }

    return "--";
  }

  String getPhone(){
    String number = "--";

    if(data.phone != null) {
      Phone phone = data.phone!.first; //Phone object

      if(phone.phone != null){
        number = "0${phone.phone}"; //only if exists
      }
    }

    return number;
  }

  String getCity(){
    if(data.address != null) {
      return data.address!.city ?? "--";
    }

    return "--";
  }
}
