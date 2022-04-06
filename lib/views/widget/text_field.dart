import 'package:flutter/material.dart';

import '../../utilis.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String addHintText;
  final type;
  const CustomTextField({Key? key, required this.addHintText, required this.controller, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, ),
      child: TextFormField(
        controller: controller,
        keyboardType: type == 'num' ? TextInputType.number : TextInputType.text,
        decoration:  InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: blue),
                borderRadius: BorderRadius.circular(32.0)
            ),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: blue),
                borderRadius: BorderRadius.circular(32.0)
            ),
            fillColor: blue,

            //contentPadding: const EdgeInsets.symmetric(vertical: 8),
            filled: true,
            hintText: addHintText,
            hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5
            )

        ),


      ),
    );
  }
}
