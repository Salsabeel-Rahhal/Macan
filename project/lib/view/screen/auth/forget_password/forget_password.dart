import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/view/screen/auth/forget_password/verfication_page.dart';
import 'package:project/view/widget/auth/custom_text_form_auth.dart';
import '../../../../controller/auth/forget_password_controller.dart';
import '../../../../controller/user_controller.dart';
import '../../../../data/model/user_model.dart';
import '../../../widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final controller = ForgetControllerImp();
  bool isObsecure = true;
  final _keyForm = GlobalKey<FormState>();
  final emailController = TextEditingController();

  _handleCheckAction() async {
    if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
      String email = emailController.text;
      ;
      User user = User(email: email, password: null);
      EasyLoading.show(status: "Loading");
      UserController().getemail(user).then((value) {
        EasyLoading.dismiss();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerficationPage()));
      }).catchError((ex) {
        EasyLoading.dismiss();
        EasyLoading.showError(ex.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Form(
        key: _keyForm,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 30,
          ),
          // إ
          Text(
            "30".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "31".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 124, 126, 126),
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormAuth(
            hintText: "15".tr,
            labelText: "",
            iconData: Icons.email_outlined,
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonAuth(
              width: 150,
              text: "32".tr,
              onPressed: () {
                _handleCheckAction();
              }),
          const SizedBox(
            height: 50,
          ),
        ]),
      ),
    ));
  }
}
