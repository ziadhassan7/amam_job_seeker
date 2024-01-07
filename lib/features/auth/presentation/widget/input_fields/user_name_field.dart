import 'package:flutter/material.dart';
import '../../../../app_common_widgets/input_field/input_field.dart';
import '../../manager/controller/input_controller.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({super.key, required this.fullWidth});

  final double fullWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputField(
            label: "First Name",
            isPassword: false,
            maxLines: 1,
            textController: InputController.firstName,
            formKey: InputController.firstNameFormKey,
            validator: InputController.validator,
          ),
        ),

        const SizedBox(width: 8,),

        Expanded(
          child: InputField(
            label: "Last Name",
            isPassword: false,
            maxLines: 1,
            textController: InputController.lastName,
            formKey: InputController.lastNameFormKey,
            validator: InputController.validator,
          ),
        ),
      ],
    );
  }

}
