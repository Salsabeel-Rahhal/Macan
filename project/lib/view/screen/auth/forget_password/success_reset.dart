import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/view/screen/auth/sign_in_page.dart';

class SuccessReset extends StatefulWidget {
  const SuccessReset({super.key});

  @override
  State<SuccessReset> createState() => _SuccessResetState();
}

class _SuccessResetState extends State<SuccessReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: LottieBuilder.asset('assets/animations/f9.json'),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              child: Center(
                  child: Text(
                "40".tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 74, 20, 140),
                      Color.fromARGB(255, 182, 153, 217)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25.0)),
              child: MaterialButton(
                padding: const EdgeInsets.symmetric(vertical: 15),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()));
                },
                child: Text(
                  "41".tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
