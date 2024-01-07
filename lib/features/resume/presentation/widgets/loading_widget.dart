import 'package:amam_job_seeker_assessment/features/resume/presentation/manager/state_manager/upload_loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/styles/app_colors.dart';

class LoadingWidget extends ConsumerWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(uploadLoadingProvider);

    return Visibility(
        visible: isLoading,
        child: const LinearProgressIndicator(color: AppColor.accent,));
  }
}
