import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToVerfiyCodeSignUp();
}

class SignUpControllerImp extends SignUpController {
  // Controller for Sign Up
  late TextEditingController signUpEmail;
  late TextEditingController signUpPassword;
  late TextEditingController userName;
  late TextEditingController phone;

  @override
  signUp() {}

  @override
  goToVerfiyCodeSignUp() {
    Get.toNamed(AppRoute.signIn);
  }

  @override
  void onInit() {
    signUpEmail = TextEditingController();
    signUpPassword = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    signUpEmail.dispose();
    signUpPassword.dispose();
    userName.dispose();
    phone.dispose();
    super.dispose();
  }
}
