import 'package:amam_job_seeker_assessment/futures/resume/presentation/manager/state_manager/upload_success_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state_manager/upload_failed_provider.dart';
import '../state_manager/upload_loading_provider.dart';

class UploadStatusController {

  //Functions
  static void resetErrorMessage(WidgetRef ref){
    //reset - hide
    ref.read(uploadFailedProvider.notifier).hide();
    ref.read(uploadSuccessProvider.notifier).hide();
    ref.read(uploadLoadingProvider.notifier).done();
  }

  static void triggerLoading(WidgetRef ref){
    ref.read(uploadLoadingProvider.notifier).loading(); //show loading
    ref.read(uploadSuccessProvider.notifier).hide(); //no success yet
  }

  static void finishLoading(WidgetRef ref){
    ref.read(uploadLoadingProvider.notifier).done(); //off loading
    ref.read(uploadSuccessProvider.notifier).show(); //success
  }

}