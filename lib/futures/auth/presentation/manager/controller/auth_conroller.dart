import 'dart:async';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/manager/controller/input_controller.dart';
import 'package:amam_job_seeker_assessment/futures/auth/presentation/manager/state_manger/auth_message_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/custom_log.dart';
import '../../../../../core/firebase/firebase_auth/auth.dart';

class AuthController {
  late final WidgetRef _ref;

  AuthController(this._ref);

  Future<bool> login() async {
    try {
      await Auth().login(
          email: InputController.email_login.text,
          password: InputController.password_login.text);

      return true;

    } on FirebaseAuthException catch (e) {
      _ref.watch(authMessageProvider.notifier).postError(e);
      return false;
    }
  }

  Future<bool> register() async {
    try {
      await Auth().registerUser(
          name: "${InputController.firstName.text} ${InputController.lastName.text}",
          email: InputController.email_register.text,
          password: InputController.password_register.text);

      return true;

    } on FirebaseAuthException catch (e) {
      _ref.watch(authMessageProvider.notifier).postError(e);
      return false;
    }
  }

  static Future<bool> logout() async {
    try {
      await Auth().logout();

      return true;

    } on FirebaseAuthException catch (e) {
      Log("FirebaseAuth:", e);
      return false;
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
