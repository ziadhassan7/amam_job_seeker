import 'package:flutter/material.dart';

class InputController{

  // Controllers
  static TextEditingController firstName = TextEditingController();
  static TextEditingController lastName = TextEditingController();
  static TextEditingController email_register = TextEditingController();
  static TextEditingController password_register = TextEditingController();
  static TextEditingController rePassword = TextEditingController();

  static TextEditingController email_login = TextEditingController();
  static TextEditingController password_login = TextEditingController();


  //Form Keys
  static final GlobalKey<FormState> firstNameFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> lastNameFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> emailFormKey_register = GlobalKey<FormState>();
  static final GlobalKey<FormState> passwordFormKey_register = GlobalKey<FormState>();
  static final GlobalKey<FormState> rePasswordFormKey = GlobalKey<FormState>();

  static final GlobalKey<FormState> emailFormKey_login = GlobalKey<FormState>();
  static final GlobalKey<FormState> passwordFormKey_login = GlobalKey<FormState>();



  static String? validator(String? value){
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    }
    return null;
  }

  static String? rePasswordValidator(String? value){
    if (value == null || value.isEmpty
        || (password_register.text != rePassword.text)) {
      return "Password is not the same";
    }
    return null;
  }

  static bool validateForRegister(){
    return firstNameFormKey.currentState!.validate()
        && lastNameFormKey.currentState!.validate()
        && emailFormKey_register.currentState!.validate()
        && passwordFormKey_register.currentState!.validate()
        && rePasswordFormKey.currentState!.validate();
  }

  static bool validateForLogin(){
    return emailFormKey_login.currentState!.validate()
        && passwordFormKey_login.currentState!.validate();
  }
}