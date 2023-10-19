import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/custom_log.dart';
import '../../../../../core/firebase/firebase_auth/auth_error_handler.dart';

final authMessageProvider = StateNotifierProvider<AuthMessageProvider, String>((ref) {

  return AuthMessageProvider();
});

class AuthMessageProvider extends StateNotifier<String>{

  AuthMessageProvider() : super("");

  void postError(FirebaseAuthException e) {
    Log("Firebase Auth", e);
    state = AuthErrorHandler.getMessage(e);
  }

  void clear() => state = "";

}