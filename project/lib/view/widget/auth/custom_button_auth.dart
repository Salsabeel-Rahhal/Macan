import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonAuth extends StatelessWidget {
  final String text;
  final double width;
  final void Function()? onPressed;
  const CustomButtonAuth(
      {super.key, required this.text, this.onPressed, required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 60,
      width: width,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 74, 20, 140),
              Color.fromARGB(255, 182, 153, 217)
            ],
          ),
          borderRadius: BorderRadius.circular(25.0)),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
