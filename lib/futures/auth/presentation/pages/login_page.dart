import 'package:amam_job_seeker_assessment/futures/app_common_widgets/input_field.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/manager/input_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(

        child: Column(
          children: [
            const TextView("Amam", size: 18,),

            InputField(
                label: "Email",
                isPassword: false,
                textController: InputController.email,
                isExpanded: false),

            InputField(
                label: "Password",
                isPassword: true,
                textController: InputController.password,
                isExpanded: false),
          ],
        ),
      ),
    );
  }
}
