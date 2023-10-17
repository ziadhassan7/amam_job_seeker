import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/app_router.dart';
import '../../../../app_common_widgets/text_view.dart';
import '../../manager/state_manger/auth_message_provider.dart';
import '../../pages/login_page.dart';

class GoToLoginText extends ConsumerWidget {
  const GoToLoginText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextView("Already have an account?"),
        TextButton(
            onPressed: (){
              AppRouter.navigateTo(context, const LoginPage(), isReplace: true);
              ref.read(authMessageProvider.notifier).clear();
            }, child: const Text("Login")),
      ],
    );
  }
}
