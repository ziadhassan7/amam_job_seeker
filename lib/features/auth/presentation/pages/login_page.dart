import 'package:amam_job_seeker_assessment/features/auth/presentation/widget/buttons/login_button.dart';
import 'package:amam_job_seeker_assessment/features/auth/presentation/widget/change_auth_page_button/go_to_register_text.dart';
import 'package:amam_job_seeker_assessment/features/auth/presentation/widget/error_text.dart';
import 'package:amam_job_seeker_assessment/features/auth/presentation/widget/input_fields/login/email_field_login.dart';
import 'package:amam_job_seeker_assessment/features/auth/presentation/widget/input_fields/login/password_field_login.dart';
import 'package:amam_job_seeker_assessment/features/auth/presentation/widget/leading_text.dart';
import 'package:flutter/material.dart';
import '../../../app_common_widgets/adaptive_container.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const double _maxWidth = 400;

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(
        child: AdaptiveContainer(
          maxWidth: _maxWidth,

          child: SingleChildScrollView(

            child: Column(
              children: [
                ////Login - Text
                LeadingText(title: "Login"),

                //Fields
                EmailFieldLogin(),
                PasswordFieldLogin(),
                //Don't have an Account? Signup
                GoToRegisterText(),


                //error text
                ErrorText(),
                //sign up button
                LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
