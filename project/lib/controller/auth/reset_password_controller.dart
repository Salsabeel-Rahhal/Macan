import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessReset();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;

  @override
  resetpassword() {}

  @override
  goToSuccessReset() {
    // Get.toNamed(AppRoute.successReset);
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
