import 'package:flutter/material.dart';

class MobileTitleAndInputField extends StatelessWidget {
  MobileTitleAndInputField(
      {super.key,
      required this.txt,
      this.left_margin,
      required this.focusNode,
      required this.controller,
      this.validatorFunction,
      required this.containerPadding});

  final String txt;
  final double? left_margin;
  FocusNode focusNode;
  var controller;
  final double containerPadding;

  String Function(String?)? validatorFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: containerPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: left_margin!),
            child: Text(
              txt,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            //height: MediaQuery.of(context).size.height*0.05,
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              validator: validatorFunction,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: const BorderSide(
                      color: Colors.green,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
