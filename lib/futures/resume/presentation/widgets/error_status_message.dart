import 'package:amam_job_seeker_assessment/futures/resume/presentation/manager/state_manager/upload_failed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_common_widgets/text_view/text_view.dart';

class ErrorStatusMessage extends ConsumerWidget {
  const ErrorStatusMessage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isShow = ref.watch(uploadFailedProvider);

    return Visibility(
        visible: isShow,
        child: const TextView("Error Occurred", color: Colors.red,));
  }
}
