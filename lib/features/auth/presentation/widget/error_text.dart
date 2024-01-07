import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app_common_widgets/text_view/text_view.dart';
import '../manager/state_manger/auth_message_provider.dart';

class ErrorText extends ConsumerWidget {
  const ErrorText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authMessage = ref.watch(authMessageProvider);

    return TextView(authMessage, color: Colors.red,);
  }
}
