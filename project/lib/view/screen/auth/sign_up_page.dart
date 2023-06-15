import 'package:email_validator/email_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import '../../../controller/user_controller.dart';
import '../../../data/model/user_model.dart';
import '../../../main.dart';
import '../../widget/alert_exit_app.dart';
import '../../widget/auth/custom_text_form_auth.dart';
import 'package:project/view/screen/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import '../../widget/auth/custom_text.dart';
import '../../widget/bars/my_app_bar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = false;
  final _keyForm = GlobalKey<FormState>();
  final _controllerUserName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPhoneNumber = TextEditingController();
  final _controllerPassword = TextEditingController();
  _handleSignUpAction(BuildContext context) {
    if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
      User user = User(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        userName: _controllerUserName.text,
        phoneNumber: _controllerPhoneNumber.text,
      );

      try {
        EasyLoading.show(status: "Loading");
        UserController().create(user);
        EasyLoading.dismiss();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplachPage()),
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
          title: "23".tr,
          image: const AssetImage(
            "assets/images/onboardingone.png",
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Text(
                  "24".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    key: _keyForm,
                    child: Column(
                      children: [
                        CustomTextFormAuth(
                          isobscureText: false,
                          hintText: "26".tr,
                          labelText: "25".tr,
                          iconData: Icons.person_2_outlined,
                          controller: _controllerUserName,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return '47'.tr;
                            } else if (text.length < 4 || text.length > 20) {
                              return '48'.tr;
                            }
                            return null;
                          },
                        ),
                        CustomTextFormAuth(
                          isobscureText: false,
                          hintText: "16".tr,
                          labelText: "15".tr,
                          iconData: Icons.email_outlined,
                          controller: _controllerEmail,
                          validator: (text) {
                            if (text == null ||
                                !EmailValidator.validate(text)) {
                              return "17".tr;
                            }
                            return null;
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: _controllerPassword,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return '20'.tr;
                              } else if (text.length < 4 || text.length > 10) {
                                return '20'.tr;
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
                                  style: TextStyle(fontSize: 15),
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
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                            controller: _controllerPhoneNumber,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 30,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: Text(
                                "27".tr,
                                style: const TextStyle(fontSize: 15),
                              ),
                              hintText: "28".tr,
                              hintStyle: const TextStyle(fontSize: 15),
                              suffixIcon: const Icon(
                                Icons.phone_android_outlined,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "45".tr;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
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
                        _handleSignUpAction(context);
                      }
                    },
                    child: Text(
                      "23".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  textOne: "29".tr,
                  textTwo: "12".tr,
                  onTap1: const SignInPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
