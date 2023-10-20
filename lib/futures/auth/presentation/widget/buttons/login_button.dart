import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/app_router.dart';
import '../../../../app_common_widgets/custom_button.dart';
import '../../../../home/presentation/pages/home_page.dart';
import '../../manager/controller/auth_conroller.dart';
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

            AuthController.isLogged().then((value) {
              if(value) {
                AppRouter.navigateTo(context, const HomePage());
              }
            });
          }
        }
    );
  }
}
