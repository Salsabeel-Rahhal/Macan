import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../controller/auth/verfiy_code_sign_up.dart';
import '../../widget/auth/custom_button_auth.dart';
// ignore: unused_import
import '../../widget/auth/custom_text.dart';
import '../../widget/bars/my_app_bar.dart';

class VerfiyCodeSignUp extends StatefulWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  State<VerfiyCodeSignUp> createState() => _VerfiyCodeSignUpState();
}

class _VerfiyCodeSignUpState extends State<VerfiyCodeSignUp> {
  final controller = VerfiyCodeSignUpImp();

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 74, 20, 140),
        Color.fromARGB(255, 6, 122, 51),
      ],
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                GradientText("Verification Code", colors: gradient.colors),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Re-send Code",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(30),
                    numberOfFields: 5,
                    decoration: InputDecoration(
                      border: const GradientOutlineInputBorder(
                        gradient: gradient,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 243, 239, 239),
                      enabledBorder: GradientOutlineInputBorder(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp();
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      " You can re-send the code after 30 minutes",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "03:05 ",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                CustomButtonAuth(
                  text: "Continue",
                  width: 200,
                  onPressed: () {
                    controller.goToSuccessSignUp();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
