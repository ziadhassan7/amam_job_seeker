import 'package:amam_job_seeker_assessment/core/styles/box_decoration.dart';
import 'package:amam_job_seeker_assessment/core/styles/padding.dart';
import 'package:amam_job_seeker_assessment/features/app_common_widgets/text_view/text_view.dart';
import 'package:flutter/material.dart';
import '../../../data/model/profile_model_data.dart';
import '../../widgets/box_title.dart';

class SkillsBox extends StatelessWidget {
  const SkillsBox({super.key, required this.data});

  final ProfileModelData data;

  @override
  Widget build(BuildContext context) {

    List skills = getSkills();

    return skills.isEmpty
    ? const SizedBox()

    : Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const BoxTitle("Skills"),

        Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: <Widget>[
            for (String skill in skills)
              FilterChip(
                //color: MaterialStateProperty.all(Color.fromRGBO(234, 234, 234, 1.0)),
                surfaceTintColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                elevation: 5,
                label: TextView(skill, size: 10, fontFamily: FontFamily.roboto, color: Colors.black, weight: FontWeight.bold,),
                onSelected: null,
              )
          ],
        ),

      ],
    );
  }

  List getSkills(){
    if(data.skills != null) {
      if(data.skills!.overallSkills != null){
        return data.skills!.overallSkills!;
      }
    }

    return [];
  }


  Widget skillWidget(String skill){
    return Container(
      width:  skill.length * 10 + 20,
      padding: const CustomPadding(vertical: 18, horizontal: 8),
      decoration: CustomDecoration(
          backgroundColor: Colors.green.shade50,
          radius: 40
      ),

      child: TextView(skill, size: 10,),
    );
  }
}

/*
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: skills.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 140,
              childAspectRatio: 4 / 1.4,
              crossAxisSpacing: 26,
              mainAxisSpacing: 15
          ),

          itemBuilder: (BuildContext context, int index) {

            String skill = skills[index];

            return skillWidget(skill);
          },
        )
 */
