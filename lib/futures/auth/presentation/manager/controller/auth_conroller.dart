import 'dart:async';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/manager/controller/input_controller.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/manager/state_manger/auth_message_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/firebase/firebase_auth/auth.dart';

class AuthController {
  late final WidgetRef _ref;

  AuthController(this._ref);

  login() async {
    try {
      await Auth().login(
          email: InputController.email.text,
          password: InputController.password.text);

    } on FirebaseAuthException catch (e) {
      _ref.watch(authMessageProvider.notifier).postError(e);
    }
  }

  register() async {
    try {
      await Auth().registerUser(
          name: "${InputController.firstName.text} ${InputController.lastName.text}",
          email: InputController.email.text,
          password: InputController.password.text);

    } on FirebaseAuthException catch (e) {
      _ref.watch(authMessageProvider.notifier).postError(e);
    }
  }

  logout() async {
    try {
      await Auth().logout(
          email: InputController.email.text,
          password: InputController.password.text);

    } on FirebaseAuthException catch (e) {
      _ref.watch(authMessageProvider.notifier).postError(e);
    }
  }


  static Future<bool> isLogged() async {
    final Completer<bool> completer = Completer<bool>();

    Auth().authStateChanges.listen((user) {
      final bool isLogged = (user != null);

      completer.complete(isLogged);
    });

    return await completer.future;
  }
}
