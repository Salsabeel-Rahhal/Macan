import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/auth/reset_password_controller.dart';
import 'package:project/view/screen/auth/forget_password/success_reset.dart';
import 'package:project/view/widget/auth/custom_button_auth.dart';
import 'package:project/view/widget/auth/custom_text_form_auth.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final controller = ResetPasswordControllerImp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "44".tr,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          GradientText("36".tr, textAlign: TextAlign.center, colors: const [
            Color.fromARGB(255, 74, 20, 140),
            Color.fromARGB(255, 6, 122, 51)
          ]),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormAuth(
            hintText: "42".tr,
            labelText: "37".tr,
            iconData: Icons.password_outlined,
            // valid: (val) {
            //   return validInput(val!, 5, 20, "password");
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormAuth(
            hintText: "43".tr,
            labelText: "38".tr,
            iconData: Icons.password_outlined,
            // valid: (val) {
            //   return validInput(val!, 5, 20, "password");
            // },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonAuth(
              width: 200,
              text: "39".tr,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuccessReset()));
              })
        ]),
      ),
    );
  }
}
