import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:medical/utilis.dart';

class PhoneNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  const PhoneNumberTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: blue
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, ),
        margin: const EdgeInsets.symmetric(horizontal: 16),

        child: Row(
          children: [
            (
              CountryCodePicker(
                initialSelection: 'IN',
                showCountryOnly: true,
                showFlagMain: false,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                )
      ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: VerticalDivider(
                color: Colors.white,
                thickness: 1,
              ),
            ),
           Expanded(

               child: TextFormField(
                 controller:  controller,
                 keyboardType: TextInputType.number,
                 decoration: const InputDecoration(
                     focusedBorder: InputBorder.none,
                     enabledBorder: InputBorder.none,
                     errorBorder: InputBorder.none,
                     disabledBorder: InputBorder.none,
                     hintText: '9992424242',
                     hintStyle: TextStyle(
                         color: Colors.white,
                         fontSize: 12,
                         fontWeight: FontWeight.w400,
                         letterSpacing: 1.5
                     )
                 ),


           ))




          ],
        ),
    );
  }
}
