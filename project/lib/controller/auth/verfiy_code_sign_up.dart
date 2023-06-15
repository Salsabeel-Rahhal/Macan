import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';

abstract class VerfiyCodeSignUp extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerfiyCodeSignUpImp extends VerfiyCodeSignUp {
  late String verfiyCode;
  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }
}
