import 'package:amam_job_seeker_assessment/features/profile/presentation/views/info_box/info_row.dart';
import 'package:amam_job_seeker_assessment/features/profile/presentation/widgets/box_title.dart';
import 'package:flutter/material.dart';
import '../../../data/model/profile_model_data.dart';

class WorkExperienceBox extends StatelessWidget {
  const WorkExperienceBox({super.key, required this.data});

  final ProfileModelData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const BoxTitle("Work Experience"),

        InfoRow("Institution", getJobTitle()),
        InfoRow("Employer", getEmployer()),
        InfoRow("Description", getDescription()),

      ],
    );
  }

  String getJobTitle(){
    if(data.employer != null) {
      return data.employer!.first.role ?? "--";
    }

    return "--";
  }

  String getEmployer(){
    if(data.employer != null) {
      return data.employer!.first.companyName ?? "--";
    }

    return "--";
  }

  String getDescription(){
    if(data.employer != null) {
      return data.employer!.first.description ?? "--";
    }

    return "--";
  }
}
