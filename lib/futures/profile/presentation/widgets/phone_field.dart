import 'package:amam_job_seeker_assessment/futures/profile/presentation/manager/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import '../../../app_common_widgets/input_field.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: "Email",
      isPassword: false,
      textController: ProfileController.phoneNumber,
    );
  }
}
