import 'package:get/get.dart';
import 'package:project/core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verfiyCode;
  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.rasetPassword);
  }
}
