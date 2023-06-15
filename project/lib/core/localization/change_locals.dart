import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/core/constant/theme.dart';
import 'package:project/services/my_services.dart';

class LocalController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.storage.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    if (myServices.storage.getString("lang") == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (myServices.storage.getString("lang") == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
