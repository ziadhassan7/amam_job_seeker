import 'package:flutter/material.dart';

class ProfileController{

  static TextEditingController phoneNumber = TextEditingController();

  static final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();


  static String? validator(String? value){
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    }
    return null;
  }

  static bool isValid(){
    return phoneFormKey.currentState!.validate();
  }

}