import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldLabel extends StatelessWidget {


  final String addLabel;
   const TextFieldLabel({Key? key, required this.addLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Text(addLabel,
        style:  GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Colors.white
        ),
      ),
    );
  }
}
