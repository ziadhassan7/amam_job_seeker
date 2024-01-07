import 'package:amam_job_seeker_assessment/features/profile/presentation/views/info_box/education.dart';
import 'package:amam_job_seeker_assessment/features/profile/presentation/views/info_box/personal_info.dart';
import 'package:amam_job_seeker_assessment/features/profile/presentation/views/info_box/skills.dart';
import 'package:amam_job_seeker_assessment/features/profile/presentation/views/info_box/work_experience.dart';
import 'package:flutter/material.dart';
import '../../../app_common_widgets/text_view/text_view.dart';
import '../../data/model/profile_model_data.dart';


class ProfileDataView extends StatelessWidget {
  const ProfileDataView({super.key, required this.data});

  final ProfileModelData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        PersonalInfoBox(data: data),
        WorkExperienceBox(data: data),
        EducationBox(data: data),
        SkillsBox(data: data),

      ],
    );
  }


  Widget infoWidget(String title, String data){
    return Row(
      children: [
        TextView("$title:", weight: FontWeight.bold,),
        const SizedBox(width: 10,),
        TextView(data),
      ],
    );
  }

}
