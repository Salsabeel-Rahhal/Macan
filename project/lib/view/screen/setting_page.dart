import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project/view/screen/auth/forget_password/reset_password.dart';
import 'package:project/view/screen/auth/sign_in_page.dart';
import 'package:project/view/screen/language.dart';
import 'package:project/view/widget/auth/custom_text.dart';

import '../widget/alert_exit_app.dart';
import '../widget/bars/my_app_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
  });

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late final List<Widget>? children;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 74, 20, 140),
          Color.fromARGB(255, 182, 153, 217)
        ])),
        child: ListView(
          children: [
            Row(
              children: [
                LottieBuilder.asset('assets/animations/f7.json'),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  " Account",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change Password", [
              CustomText(
                textTwo: "Go to reset password",
                onTap1: const ResetPage(),
              )
            ]),
            buildAccountOptionRow(context, "Social & Share App", [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                  label: const Text("Facebbook")),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.telegram),
                  label: const Text("Telegram")),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.tiktok),
                  label: const Text("TikTok")),
            ]),
            buildAccountOptionRow(context, "Language", [
              CustomText(
                textTwo: "Go to change language",
                onTap1: const LanguagePage(),
              )
            ]),
            buildAccountOptionRow(context, "Help", [
              CustomText(
                textTwo: "Help Center",
              ),
              CustomText(
                textTwo: "Contact Support",
              ),
              CustomText(
                textTwo: "Permissions",
              )
            ]),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  " Notifications",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you"),
            buildNotificationOptionRow("Account activity"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(7),
                  width: 120,
                  height: 40,
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
                        alertExitApp();
                      },
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white70),
        ),
        SwitchExample(),
      ],
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, List<Widget> children) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Close",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white70,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.green;
        }
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.green.withOpacity(0.54);
        }
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        return null;
      },
    );

    return Switch(
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}
