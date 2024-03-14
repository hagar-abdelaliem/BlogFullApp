import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  FocusNode focusNode;
  String? Function(String?)? validatorFunction;
  var controller;

  PasswordField({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.validatorFunction,
  });

  @override
  State<StatefulWidget> createState() => _PasswordField();
}

class _PasswordField extends State<PasswordField> {
  bool pass = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 0, 25.0, 0),
      // width: MediaQuery.of(context).size.width*0.20,
      //height: MediaQuery.of(context).size.height*0.06,
      child: TextFormField(
        focusNode: widget.focusNode,
        obscureText: pass,
        controller: widget.controller,
        validator: widget.validatorFunction,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.green,
            ),
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    pass = !pass;
                  });
                },
                child: Icon(
                  pass ? Icons.visibility_off : Icons.visibility,
                  color: Colors.green,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide: const BorderSide(color: Colors.green, width: 1.5))),
      ),
    );
  }
}
