import 'package:amam_job_seeker_assessment/core/styles/app_colors.dart';
import 'package:amam_job_seeker_assessment/core/styles/app_screen.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? label;
  final bool isPassword;
  final double? width;
  final int? maxLines;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final GlobalKey<FormState>? formKey;
  final bool isExpanded;

  const InputField(
      {super.key,
        required this.label,
        required this.isPassword,
        this.width,
        this.maxLines,
        required this.textController,
        this.validator,
        this.formKey,
        this.isExpanded = false})

      : assert(validator == null || formKey != null,
        'Cannot have a validator without a formKey'
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Visibility(
            visible: label != null,

            child: TextView(
              label!,
              size: 12,
              weight: FontWeight.w500,
              color: AppColor.primaryLight,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),

            child: SizedBox(
              height: isExpanded ? (AppScreen(context).height * 0.40) : 70,

              child: Form(
                key: formKey,

                child: TextFormField(
                    expands: isExpanded ? true : false,
                    textAlignVertical: TextAlignVertical.top,
                    minLines: null,
                    maxLines: isPassword? 1:maxLines,
                    obscureText: isPassword? true:false,
                    enableSuggestions: isPassword? false:true,
                    autocorrect: isPassword? false:true,

                    controller: textController,
                    validator: validator,

                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 3, color: AppColor.accent),
                          borderRadius: BorderRadius.circular(5)),

                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
