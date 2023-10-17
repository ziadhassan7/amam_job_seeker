import 'package:flutter/material.dart';

class InputController{

  static TextEditingController firstName = TextEditingController();
  static TextEditingController lastName = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController rePassword = TextEditingController();


  static final GlobalKey<FormState> firstNameFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> lastNameFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> rePasswordFormKey = GlobalKey<FormState>();


  static String? validator(String? value){
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    }
    return null;
  }

  static String? rePasswordValidator(String? value){
    if ((value == null || value.isEmpty)
        && (password.text == rePassword.text)) {
      return "Password is not the same";
    }
    return null;
  }

  static bool validateForRegister(){
    return firstNameFormKey.currentState!.validate()
        && lastNameFormKey.currentState!.validate()
        && emailFormKey.currentState!.validate()
        && passwordFormKey.currentState!.validate()
        && rePasswordFormKey.currentState!.validate();
  }

  static bool validateForLogin(){
    return emailFormKey.currentState!.validate()
        && passwordFormKey.currentState!.validate();
  }
}