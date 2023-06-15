import 'package:flutter/cupertino.dart';
import 'package:project/core/constant/routes.dart';
import 'package:project/view/screen/auth/forget_password/forget_password.dart';
import 'package:project/view/screen/auth/forget_password/reset_password.dart';
import 'package:project/view/screen/auth/forget_password/success_reset.dart';
import 'package:project/view/screen/auth/success_sign_up.dart';
import 'package:project/view/screen/auth/forget_password/verfication_page.dart';
import 'package:project/view/screen/auth/verfiy_sign_up.dart';
import 'package:project/view/screen/home_page.dart';
import 'package:project/view/screen/on_boarding_page.dart';
import 'package:project/view/screen/auth/sign_up_page.dart';
import 'package:project/view/screen/shops.dart';
import 'view/screen/auth/sign_in_page.dart';
import 'package:project/view/screen/map_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.onBoarding: (context) => const OnBoardingPage(),
  AppRoute.signIn: (context) => const SignInPage(),
  AppRoute.signIn: (context) => const SignInPage(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verfication: (context) => const VerficationPage(),
  AppRoute.rasetPassword: (context) => const ResetPage(),
  AppRoute.successReset: (context) => const SuccessReset(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
  AppRoute.homePage: (context) => ShopPage(),
  AppRoute.profilePage: (context) => const SuccessReset(),
  AppRoute.favoratePage: (context) => const SuccessSignUp(),
  AppRoute.settingsPage: (context) => const SuccessReset(),
  AppRoute.reservationPage: (context) => const SuccessSignUp(),
  AppRoute.mapPage: (context) => MapPage(),
  AppRoute.verfiyCodeSignUp: (context) => const VerfiyCodeSignUp(),
};
