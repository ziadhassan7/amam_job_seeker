import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app_common_widgets/custom_button.dart';
import '../../manager/controller/account_conroller.dart';
import '../../manager/controller/input_controller.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = AuthController(ref);

    return CustomButton(
        label: "Login",
        onPressed: () {
          if(InputController.validateForLogin()){
            authController.login();
          }
        }
    );
  }
}
