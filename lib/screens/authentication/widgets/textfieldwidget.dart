import 'package:flutter/material.dart';

customtextfieldwidget(String hint) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    child: TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    ),
  );
}
