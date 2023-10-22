import 'package:flutter/material.dart';
import '../../../../app_common_widgets/input_field/input_field.dart';
import '../../manager/controller/input_controller.dart';

class EmailFieldLogin extends StatelessWidget {
  const EmailFieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: "Email",
      isPassword: false,
      keyboardType: TextInputType.emailAddress,
      textController: InputController.email,
      formKey: InputController.emailFormKey_register,
      validator: InputController.validator,
    );
  }
}
