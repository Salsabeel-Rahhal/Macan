import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:lottie/lottie.dart';
import 'package:project/view/screen/setting_page.dart';
import 'package:project/view/widget/auth/custom_text.dart';
import 'package:project/view/widget/auth/custom_text_form_auth.dart';

import '../../controller/user_controller.dart';
import '../../data/model/user_model.dart';
import '../widget/bars/my_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controllerUsername = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
            icon: const Icon(Icons.settings),
            color: Colors.white,
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 7, right: 16),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 74, 20, 140),
          Color.fromARGB(255, 182, 153, 217)
        ])),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildTextField("UserName", "salsabeel", false),
                      buildTextField("Email", "sa@gmail.com", false),
                      buildTextField("Password", "********", true),
                      buildTextField("Phone Number", "1234567890", false),
                      buildTextField("Country", "Jordan", false),
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1.5,
                            blurRadius: 12,
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(2, 12)),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1.5,
                              blurRadius: 12,
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 12)),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildTextField(String labelText, String hintText, bool isPassword) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: isPassword ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
              labelText,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 15, color: Colors.white60),
            border: GradientOutlineInputBorder(
                width: 2,
                gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                ),
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
