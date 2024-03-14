import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  TextEditingController controller;
  String? text;
  String? Function(String?)? validatorFunction;

  SimpleTextField(
      {super.key,
      required this.text,
      required this.controller,
      required this.validatorFunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(height: 0.4),
      ),
      controller: controller,
      validator: validatorFunction,
    );
  }
}
