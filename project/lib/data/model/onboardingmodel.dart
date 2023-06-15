import 'package:lottie/lottie.dart';

class OnBoardingModel {
  final String? title;
  final String? image;
  final String? body;
  final LottieBuilder? animation;
  OnBoardingModel(
      {this.animation,
      required this.title,
      required this.image,
      required this.body});
}
