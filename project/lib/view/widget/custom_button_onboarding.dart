import 'package:flutter/material.dart';
import '../../data/static/static.dart';
import '../screen/auth/sign_in_page.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.labelOne,
      required this.labelTwo,
      required this.currentIndex,
      required this.controller});

  final String labelOne;
  final String labelTwo;
  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 30),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 74, 20, 140),
                      Color.fromARGB(255, 182, 153, 217)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25.0)),
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex < onBoardingList.length - 1) {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.easeInOut);
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: Text(currentIndex == onBoardingList.length - 1
                    ? labelTwo
                    : labelOne),
              )),
        ],
      ),
    );
  }
}
