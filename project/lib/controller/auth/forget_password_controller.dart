import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';

abstract class ForgetController extends GetxController {
  check();
  goToVerfication();
}

class ForgetControllerImp extends ForgetController {
  late TextEditingController phone;

  @override
  check() {
    Get.toNamed(AppRoute.verfication);
  }

  @override
  goToVerfication() {
    Get.toNamed(AppRoute.verfication);
  }

  @override
  void onInit() {
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }
}
