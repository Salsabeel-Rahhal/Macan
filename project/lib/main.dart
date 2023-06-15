import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/core/localization/change_locals.dart';
import 'package:project/services/my_services.dart';
import 'package:lottie/lottie.dart';
import 'package:project/view/screen/auth/sign_in_page.dart';
import 'package:project/view/screen/map_page.dart';
import 'package:project/view/screen/shops.dart';
import 'package:project/view/screen/resrvations_page.dart';
import 'package:project/view/screen/test.dart';
import 'core/localization/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        locale: controller.language,
        builder: EasyLoading.init(),
        theme: controller.appTheme,
        home: profile());
  }
}

class SplachPage extends StatefulWidget {
  const SplachPage({
    super.key,
  });

  @override
  State<SplachPage> createState() => _SplachPageState();
}

class _SplachPageState extends State<SplachPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6)).then((value) =>
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ShopPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 74, 20, 140),
            Color.fromARGB(255, 182, 153, 217)
          ])),
          child: LottieBuilder.asset('assets/animations/f3.json'),
        ),
      ),
    );
  }
}
