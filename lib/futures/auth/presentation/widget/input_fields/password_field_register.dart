import 'package:flutter/material.dart';
import '../../../../app_common_widgets/input_field/input_field.dart';
import '../../manager/controller/input_controller.dart';

class PasswordFieldRegister extends StatelessWidget {
  const PasswordFieldRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: "Password",
      isPassword: true,
      textController: InputController.password_register,
      formKey: InputController.passwordFormKey_register,
      validator: InputController.validator,
    );
  }
}
