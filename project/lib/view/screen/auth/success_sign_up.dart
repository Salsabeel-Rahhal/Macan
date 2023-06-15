import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/view/screen/auth/sign_in_page.dart';

import '../../widget/bars/my_app_bar.dart';

class SuccessSignUp extends StatefulWidget {
  const SuccessSignUp({super.key});

  @override
  State<SuccessSignUp> createState() => _SuccessSignUpState();
}

class _SuccessSignUpState extends State<SuccessSignUp> {
  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 74, 20, 140),
        Color.fromARGB(255, 182, 153, 217),
      ],
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LottieBuilder.asset('assets/animations/f9.json'),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "46".tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "41".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
