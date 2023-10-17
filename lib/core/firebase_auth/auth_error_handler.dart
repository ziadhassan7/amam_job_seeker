import 'package:firebase_auth/firebase_auth.dart';

class AuthErrorHandler {

  static String getMessage(FirebaseAuthException e) {

    switch (e.code) {
      case "INVALID_LOGIN_CREDENTIALS":
        return "This email doesn't exist";

      default:
        return e.message ?? "Undefined Error";
    }
  }
}