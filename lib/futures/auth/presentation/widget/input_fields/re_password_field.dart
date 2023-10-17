import 'package:flutter/material.dart';
import '../../../../app_common_widgets/input_field.dart';
import '../../manager/controller/input_controller.dart';

class RePasswordField extends StatelessWidget {
  const RePasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: "Re-Enter Password",
      isPassword: true,
      textController: InputController.rePassword,
      formKey: InputController.rePasswordFormKey,
      validator: InputController.rePasswordValidator,
    );
  }
}
