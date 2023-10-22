import 'package:amam_job_seeker_assessment/core/styles/adaptive_container.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/input_fields/login/email_field_login.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/error_text.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/change_auth_page_button/go_to_login_text.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/input_fields/login/password_field_login.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/input_fields/re_password_field.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/buttons/signup_button.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/widget/input_fields/user_name_field.dart';
import 'package:flutter/material.dart';
import '../widget/leading_text.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const double _maxWidth = 600;

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(
        child: AdaptiveContainer(
          maxWidth: _maxWidth,

          child: SingleChildScrollView(

            child: Column(
              children: [
                //Create Account - Text
                LeadingText(title: "Create Account"),

                //Fields
                UserNameField(fullWidth: _maxWidth),
                EmailField(),
                PasswordField(),
                RePasswordField(),
                //Don't have an Account? Signup
                GoToLoginText(),


                //error text
                ErrorText(),
                //sign up button
                SignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
