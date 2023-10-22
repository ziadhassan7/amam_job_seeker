import 'package:flutter/material.dart';
import '../../../../../app_common_widgets/input_field/input_field.dart';
import '../../../manager/controller/input_controller.dart';

class PasswordFieldLogin extends StatelessWidget {
  const PasswordFieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: "Password",
      isPassword: true,
      textController: InputController.password_login,
      formKey: InputController.passwordFormKey_login, //you can't have duplicate keys
      validator: InputController.validator,
    );
  }
}
