import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';

abstract class SignInController extends GetxController {
  goToSignUp();
  goToForgetPassword();
}

class SignInControllerImp extends SignInController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
