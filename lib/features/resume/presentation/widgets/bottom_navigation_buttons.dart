import 'package:amam_job_seeker_assessment/features/profile/presentation/pages/profile_page.dart';
import 'package:amam_job_seeker_assessment/features/resume/presentation/manager/state_manager/upload_success_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/app_router.dart';
import '../../../app_common_widgets/custom_button.dart';
import '../../../app_common_widgets/text_view/text_view.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../manager/controller/upload_status_controller.dart';

class BottomNavigationButtons extends ConsumerWidget {
  const BottomNavigationButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isSuccess = ref.watch(uploadSuccessProvider);

    return Row(
      children: [
        const Spacer(),

        //Cancel Btn
        TextButton(
            onPressed: (){
              AppRouter.navigateTo(context, const HomePage());
            },

            child: TextButton(
              child: const TextView("Cancel", color: Colors.black,),
              onPressed: () {
                UploadStatusController.resetErrorMessage(ref);
                Navigator.pop(context);
              },
            )),

        //Next Btn
        CustomButton(
          label: "Next",
          onPressed: isSuccess? ()=> nextFunction(context, ref) : null,
        )
      ],
    );
  }

  void nextFunction(BuildContext context, WidgetRef ref){
    UploadStatusController.resetErrorMessage(ref); // to reset success and error status
    AppRouter.navigateTo(context, const ProfilePage());
  }
}
