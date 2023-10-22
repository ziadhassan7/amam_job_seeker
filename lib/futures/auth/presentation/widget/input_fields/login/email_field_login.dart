import 'package:flutter/material.dart';
import '../../../../../app_common_widgets/input_field/input_field.dart';
import '../../../manager/controller/input_controller.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: "Email",
      isPassword: false,
      keyboardType: TextInputType.emailAddress,
      textController: InputController.email,
      formKey: InputController.emailFormKey_login, //you can't have duplicate keys
      validator: InputController.validator,
    );
  }
}
