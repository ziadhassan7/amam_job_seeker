import 'package:firebase_auth/firebase_auth.dart';

class AuthErrorHandler {

  static String getMessage(FirebaseAuthException e) {

    switch (e.code) {
      case "invalid-login-credentials":
        return "Check your email & password";
      case "email-already-in-use":
        return "This email already exists";

      default:
        return e.message ?? "Undefined Error";
    }
  }
}