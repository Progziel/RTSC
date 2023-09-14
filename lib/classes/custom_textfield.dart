import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hint;
  final String? label;
  final bool? obscureText;
  const CustomTextFormField(
      {Key? key,
        this.controller,
        this.label,
        this.validator,
         required this.hint,
         this.obscureText,
   })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.black),
      obscureText: obscureText ?? false,

      decoration: InputDecoration(
        label: Text(label ?? "",),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0XFF535353)),
        filled: true,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.5),
        ),
      ),
    );
    // return TextFormField(
    //   obscureText: obscureText,
    //   controller: controller,
    //   decoration: InputDecoration(
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(
    //         color: Colors.black38,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     errorBorder: OutlineInputBorder(
    //       borderSide:
    //           const BorderSide(color: AppAssets.primaryColor, width: 0.5),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(color: Colors.black, width: 0.5),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     hintText: hintText,
    //     hintStyle: const TextStyle(color: Colors.black54, fontSize: 15),
    //     // label: CustomTextWidget(text: label ),
    //     //labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
    //   ),
    //   validator: validator,
    // );
  }
}