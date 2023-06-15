import 'package:get/get.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:project/view/screen/auth/forget_password/reset_password.dart';
import 'package:project/view/widget/auth/custom_button_auth.dart';
import 'package:project/controller/auth/verfication_controller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:project/view/widget/auth/custom_text.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class VerficationPage extends StatefulWidget {
  const VerficationPage({super.key});

  @override
  State<VerficationPage> createState() => _VerficationPageState();
}

class _VerficationPageState extends State<VerficationPage> {
  final controller = VerifyCodeControllerImp();

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
    // reset remaining time to 60 seconds
    _remainingTime = 60;

    // start the timer again
    _startTimer();

    // TODO: send a new verification code
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
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
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
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
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      // showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         title: Text("Verification Code "),
                      //         content:
                      //             Text("Code entered is $verificationCode"),
                      //       );
                      //     });
                      controller.goToResetPassword();
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
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            CustomButtonAuth(
                width: 200,
                text: "10".tr,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPage()));
                })
          ]),
        ]),
      ),
    );
  }
}
