import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:project/view/screen/setting_page.dart';

import '../../controller/user_controller.dart';

class MyProfilePage extends StatelessWidget {
  MyProfilePage({super.key});

  final _controllerUsername = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPhone = TextEditingController();
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
                  MaterialPageRoute(builder: (context) => const SettingPage()));
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
      body: FutureBuilder(
        future: UserController().getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _controllerUsername.text = snapshot.data!.userName ?? "salamR";
            _controllerEmail.text = snapshot.data!.email ?? "";
            _controllerPhone.text = snapshot.data!.phoneNumber ?? "0793333333";

            return Container(
              padding: const EdgeInsets.only(left: 16, top: 7, right: 16),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 74, 20, 140),
                Color.fromARGB(255, 182, 153, 217)
              ])),
              child: ListView(children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Stack(children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/profile2.jpg",
                            ))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      )),
                ])),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _controllerUsername,
                          validator: (value) {
                            if (value == null || value.length < 2) {
                              return "The username is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.account_circle_rounded,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "User Name",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 30),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: GradientOutlineInputBorder(
                                  width: 1,
                                  gradient: const LinearGradient(
                                    colors: [Colors.white, Colors.white],
                                  ),
                                  borderRadius: BorderRadius.circular(30))),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _controllerEmail,
                          validator: (value) {
                            if (!EmailValidator.validate(value!)) {
                              return "The email must be correct";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 30),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: GradientOutlineInputBorder(
                                  width: 1,
                                  gradient: const LinearGradient(
                                    colors: [Colors.white, Colors.white],
                                  ),
                                  borderRadius: BorderRadius.circular(30))),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _controllerPhone,
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 30),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: GradientOutlineInputBorder(
                                  width: 1,
                                  gradient: const LinearGradient(
                                    colors: [Colors.white, Colors.white],
                                  ),
                                  borderRadius: BorderRadius.circular(30))),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30,
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
                              onTap: () {
                                _handleSubmitAction();
                              },
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
                    )),
              ]),
            );
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text("There are some certian of errors"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  _handleSubmitAction() {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: "Loading");
      UserController()
          .update(
        email: _controllerEmail.text,
        userName: _controllerUsername.text,
      )
          .then((value) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess("Done");
      }).catchError((ex) {
        EasyLoading.dismiss();
        EasyLoading.showError(ex.toString());
      });
    }
  }
}
