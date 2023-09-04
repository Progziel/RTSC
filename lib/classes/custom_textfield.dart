import 'package:boxing/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hint;
  const CustomTextFormField({Key? key,this.controller,this.hint,this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Colors.black38, ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: AppAssets.primaryColor, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,

        labelStyle:
        const TextStyle(color: Colors.black, fontSize: 15),
      ),
      validator: validator,
    );
  }
}
