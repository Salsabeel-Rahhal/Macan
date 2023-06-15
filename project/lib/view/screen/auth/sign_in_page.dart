import 'package:get/get.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project/main.dart';
import 'package:project/view/screen/auth/sign_up_page.dart';
import 'package:email_validator/email_validator.dart';
import '../../widget/alert_exit_app.dart';
import '../../widget/auth/custom_text.dart';
import '../../widget/bars/my_app_bar.dart';
import '../../../controller/user_controller.dart';
import 'forget_password/forget_password.dart';
import 'package:flutter/material.dart';
import '../home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isObscure = true;
  final _keyForm = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  _handleSignInAction(BuildContext context) {
    if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
      String email = _controllerEmail.text;
      String password = _controllerPassword.text;

      try {
        EasyLoading.show(status: "Loading");
        UserController().signIn(email, password);
        EasyLoading.dismiss();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SplachPage()),
        );
        // return true; // sign-in was successful
      } catch (ex) {
        EasyLoading.dismiss();
        EasyLoading.showError(ex.toString());
        // return false; // sign-in failed
      }
    }
    // return false; // form validation failed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: MyAppBar(
          title: "12".tr,
          image: const AssetImage(
            "assets/images/onboardingone.png",
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "13".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "14".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: _controllerEmail,
                          validator: (text) {
                            if (text == null ||
                                !EmailValidator.validate(text)) {
                              return "17".tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 30,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            label: Text(
                              "15".tr,
                              style: const TextStyle(fontSize: 15),
                            ),
                            hintText: "16".tr,
                            hintStyle: const TextStyle(fontSize: 15),
                            suffixIcon: const Icon(
                              Icons.email_outlined,
                              size: 18,
                            ),
                            border: GradientOutlineInputBorder(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 74, 20, 140),
                                  Color.fromARGB(255, 6, 122, 51),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: _controllerPassword,
                          validator: (value) {
                            if (value == null || value.length < 2) {
                              return "19".tr;
                            }
                            return null;
                          },
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 30,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: Text(
                                "18".tr,
                                style: const TextStyle(fontSize: 15),
                              ),
                              hintText: "19".tr,
                              hintStyle: const TextStyle(fontSize: 15),
                              // suffixIcon: const Icon(
                              //   Icons.password_outlined,
                              //   size: 18,
                              // ),
                              border: GradientOutlineInputBorder(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 74, 20, 140),
                                    Color.fromARGB(255, 6, 122, 51),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  })),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 74, 20, 140),
                              Color.fromARGB(255, 182, 153, 217),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          onPressed: () {
                            if (_keyForm.currentState!.validate()) {
                              _handleSignInAction(context);
                            }
                          },
                          child: Text(
                            "12".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomText(
                  textOne: "",
                  textTwo: "21".tr,
                  onTap1: const ForgetPassword(),
                ),
                const SizedBox(height: 20),
                CustomText(
                  textOne: "22".tr,
                  textTwo: "23".tr,
                  onTap1: const SignUpPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
