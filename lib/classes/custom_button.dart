import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double width;
  const CustomButton(
      {super.key,
        required this.buttonText,
        required this.onTap,
        this.width = double.infinity});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: width,
          decoration: BoxDecoration(
              color: const Color(0xffFF0007),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
                buttonText,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ))),
    );
  }
}