import 'package:amam_job_seeker_assessment/futures/profile/presentation/views/info_box/info_box.dart';
import 'package:amam_job_seeker_assessment/futures/profile/presentation/widgets/box_title.dart';
import 'package:flutter/material.dart';
import '../../../data/model/profile_model_data.dart';

class EducationBox extends StatelessWidget {
  const EducationBox({super.key, required this.data});

  final ProfileModelData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const BoxTitle("Education"),


        InfoBox(
            titles: const [
              "Institution",
              "Education",
            ],
            values: [
              getEducationInstitution(),
              getEducation(),
            ]),

      ],
    );
  }


  String getEducationInstitution(){
    if(data.education != null) {
      return data.education!.first.institute ?? "--";
    }

    return "--";
  }

  String getEducation(){
    String education = "--";

    if(data.education != null) {
      education = "${data.education!.first.course}, ${data.education!.first.institute}";
    }

    return education;
  }
}
