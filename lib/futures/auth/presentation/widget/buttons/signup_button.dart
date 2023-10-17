import 'package:amam_job_seeker_assessment/futures/auth/presentation/manager/controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_widgets/custom_button.dart';
import '../../manager/controller/account_conroller.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = AuthController(ref);

    return CustomButton(
        label: "Sign Up",
        onPressed: () {
          if(InputController.validateForRegister()){
            authController.register();
          }
        }
    );
  }
}
