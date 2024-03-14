import 'package:flutter/material.dart';
import 'package:untitled2/shared/style/my_theme.dart';

class CustomTextField extends StatelessWidget {
  String text;
  Icon icon;
  String? Function(String?)? validatorFunction;
  TextEditingController controller;

  CustomTextField(
      {super.key,
      required this.text,
      required this.icon,
      required this.controller,
      required this.validatorFunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validatorFunction,
      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none),
          fillColor: MyThemeData.OnprimaryColor,
          filled: true,
          prefixIcon: icon),
    );
  }
}
