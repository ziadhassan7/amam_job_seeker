import 'package:amam_job_seeker_assessment/core/styles/padding.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/app_logo.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/buttons/login_button.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/change_auth_page_button/go_to_register_text.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/input_fields/email_field.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/error_text.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/input_fields/password_field.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(

        child: Padding(
          padding: CustomPadding(vertical: 18, horizontal: 20),

          child: Column(
            children: [
              //Logo
              AppLogo(),
              SizedBox(height: 80,),

              //Fields
              EmailField(),
              PasswordField(),
              //Don't have an Account? Signup
              GoToRegisterText(),


              Spacer(),

              //error text
              ErrorText(),
              //sign up button
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
