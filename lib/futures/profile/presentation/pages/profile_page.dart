import 'package:amam_job_seeker_assessment/core/styles/adaptive_container.dart';
import 'package:amam_job_seeker_assessment/core/styles/app_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/adaptive_app_bar.dart';
import '../../../../core/styles/padding.dart';
import '../../../app_common_widgets/text_view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const double _maxWidth = 700;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AdaptiveAppBar(context, title: "Your Profile",).getWidget(),


      body: const AdaptiveContainer(
        maxWidth: _maxWidth,

        child: Padding(
          padding: CustomPadding(vertical: 18, horizontal: 20),

          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),
                  TextView("fsaff"),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customDivider(BuildContext context){
    return Expanded(
      child: Container(color: Colors.black12,
        width: AppScreen(context).width/3, height: 1,),
    );
  }

}
