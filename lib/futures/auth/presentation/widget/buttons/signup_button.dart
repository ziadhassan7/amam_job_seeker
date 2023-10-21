import 'package:amam_job_seeker_assessment/core/app_router.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/manager/controller/input_controller.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/pages/resume_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_widgets/custom_button.dart';
import '../../manager/controller/auth_conroller.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = AuthController(ref);

    return CustomButton(
        label: "Sign Up",
        onPressed: () async {
          if(InputController.validateForRegister()){
            bool isRegistered = await authController.login();

            if (isRegistered) {
              if (context.mounted) AppRouter.navigateTo(context, const ResumePage());
            }
          }
        }
    );
  }
}
