import 'package:email_otp/email_otp.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:project/view/screen/auth/forget_password/reset_password.dart';
import 'package:project/view/widget/auth/custom_button_auth.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:project/view/widget/auth/custom_text.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

class VerficationPage extends StatefulWidget {
  const VerficationPage({super.key});

  @override
  State<VerficationPage> createState() => _VerficationPageState();
}

class _VerficationPageState extends State<VerficationPage> {
  // final controller = VerifyCodeControllerImp();

  Timer? _timer;
  int _remainingTime = 60;

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _resendCode() {
    _remainingTime = 60;
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          LottieBuilder.asset('assets/animations/f20.json'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientText("33".tr, colors: const [
                Color.fromARGB(255, 74, 20, 140),
                Color.fromARGB(255, 6, 122, 51)
              ]),
              CustomText(
                textOne: "",
                textTwo: "34".tr,
                onTap: (_remainingTime == 0) ? _resendCode : null,
              )
            ],
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(30),
                    numberOfFields: 5,
                    decoration: InputDecoration(
                        border: const GradientOutlineInputBorder(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 74, 20, 140),
                              Color.fromARGB(255, 6, 122, 51)
                            ],
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 243, 239, 239),
                        enabledBorder: GradientOutlineInputBorder(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 74, 20, 140),
                                Color.fromARGB(255, 6, 122, 51)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20))),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Verification Code "),
                              content:
                                  Text("Code entered is $verificationCode"),
                            );
                          });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPage(),
                          ));
                    }, // end onSubmit
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "35".tr,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  "$_remainingTime",
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
            // CustomButtonAuth(
            //     width: 200,
            //     text: "10".tr,
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const ResetPage()));
            //     })
          ]),
        ]),
      ),
    );
  }
}
