import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:project/view/screen/profile_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 25,
                )),
          ],
        ),
        body: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 74, 20, 140),
                    Color.fromARGB(255, 182, 153, 217)
                  ],
                ),
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // MyDrawer(),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          // controller: controller,
                          decoration: InputDecoration(
                              fillColor: Colors.white54,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 30),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              // label: const Text(
                              //   "search",
                              //   style: TextStyle(
                              //       fontSize: 15, color: Colors.black),
                              // ),
                              hintText: "search ",
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                              suffixIcon: const Icon(Icons.search_outlined,
                                  size: 18, color: Colors.black),
                              border: GradientOutlineInputBorder(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 74, 20, 140),
                                      Color.fromARGB(255, 182, 153, 217)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ]),
              )),
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path myPath = Path();
    myPath.lineTo(0, size.height / 2);
    myPath.cubicTo(size.width / 4, 3 * (size.height / 2), (3 * size.width / 4),
        size.height / 4, size.width, size.height * 0.9);
    myPath.lineTo(size.width, 0);
    return myPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
