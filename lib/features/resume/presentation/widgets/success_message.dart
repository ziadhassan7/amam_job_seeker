import 'package:amam_job_seeker_assessment/features/resume/presentation/manager/state_manager/upload_success_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_common_widgets/text_view/text_view.dart';

class SuccessMessage extends ConsumerWidget {
  const SuccessMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isSuccess = ref.watch(uploadSuccessProvider);

    return Visibility(
        visible: isSuccess,
        child: const TextView("Success", color: Colors.green,));
  }
}
