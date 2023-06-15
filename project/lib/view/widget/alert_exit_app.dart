import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "50".tr, middleText: "51".tr, actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text("yes")),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("No"))
  ]);
  return Future.value(true);
}
