import 'package:flutter/material.dart';
import '../../../../../core/styles/app_screen.dart';
import '../../../../app_common_widgets/input_field.dart';
import '../../manager/controller/input_controller.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InputField(
          label: "First Name",
          isPassword: false,
          width: AppScreen(context).width * 0.4,
          maxLines: 1,
          textController: InputController.firstName,
          formKey: InputController.firstNameFormKey,
          validator: InputController.validator,
        ),

        const Spacer(),

        InputField(
          label: "Last Name",
          isPassword: false,
          width: AppScreen(context).width * 0.4,
          maxLines: 1,
          textController: InputController.lastName,
          formKey: InputController.lastNameFormKey,
          validator: InputController.validator,
        ),
      ],
    );
  }

}
