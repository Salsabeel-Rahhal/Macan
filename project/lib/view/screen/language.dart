import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/core/localization/change_locals.dart';
import 'package:project/view/screen/on_boarding_page.dart';
import 'package:project/view/widget/auth/custom_button_auth.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LanguagePage extends GetView<LocalController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  child: GradientText(
                    "1".tr,
                    colors: const [
                      Color.fromARGB(255, 74, 20, 140),
                      Color.fromARGB(255, 6, 122, 51)
                    ],
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  onTap: () {}),
              const SizedBox(
                height: 20,
              ),
              LottieBuilder.asset('assets/animations/f8.json'),
              CustomButtonAuth(
                text: "العربية".tr,
                width: 200,
                onPressed: () {
                  controller.changeLang("ar");
                  Get.off(const OnBoardingPage());
                },
              ),
              CustomButtonAuth(
                text: "English".tr,
                width: 200,
                onPressed: () {
                  controller.changeLang("en");
                  Get.off(const OnBoardingPage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
