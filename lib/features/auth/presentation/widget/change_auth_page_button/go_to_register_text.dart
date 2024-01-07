import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/app_router.dart';
import '../../../../app_common_widgets/text_view/text_view.dart';
import '../../manager/state_manger/auth_message_provider.dart';
import '../../pages/register_page.dart';

class GoToRegisterText extends ConsumerWidget {
  const GoToRegisterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextView("Don't have an account?"),
        TextButton(
            onPressed: (){
              AppRouter.navigateTo(context, const RegisterPage(), isReplace: true);
              ref.read(authMessageProvider.notifier).clear();
            }, child: const Text("Sign Up")),
      ],
    );
  }
}
