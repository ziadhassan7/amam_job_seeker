import 'package:amam_job_seeker_assessment/core/styles/app_colors.dart';
import 'package:amam_job_seeker_assessment/futures/app_common_widgets/text_view.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? label;
  final bool isPassword;
  final TextEditingController textController;
  final bool isExpanded;

  const InputField(
      {Key? key,
        required this.label,
        required this.isPassword,
        required this.textController,
        required this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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

          child: Expanded(
            child: SizedBox(
              height: isExpanded ?
              MediaQuery.of(context).size.height * 0.40
                  : 70,

              child: TextFormField(
                  expands: isExpanded ? true : false,
                  textAlignVertical: TextAlignVertical.top,
                  minLines: null,
                  maxLines: isPassword? 1:null,
                  obscureText: isPassword? true:false,
                  enableSuggestions: isPassword? false:true,
                  autocorrect: isPassword? false:true,

                  controller: textController,
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
    );
  }
}
