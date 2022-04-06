import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/views/widget/phonenumber_textfield.dart';
import 'package:medical/views/widget/text_field.dart';
import 'package:medical/views/widget/textfield_lable.dart';

import '../services/apis.dart';
import '../services/registration_service.dart';
import '../utilis.dart';

import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _registrationCont = RegistrationService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           decoration: const BoxDecoration(
               image: DecorationImage(
                   fit: BoxFit.cover,
                   image: AssetImage(
                       'assets/bg-1.png'
                   )
               )
           ),
           child: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Center(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(vertical: 20),
                     child: Image.asset('assets/logo.png',
                       height: 120,
                       width: 120,
                     ),
                   ),
                 ),

                 Center(
                   child: Text(
                     'Create account',
                     style: GoogleFonts.poppins(
                         fontSize: 36,
                         fontWeight: FontWeight.w400,
                         color: Colors.white,
                         letterSpacing: 1.0
                     ),
                   ),
                 ),

                 const TextFieldLabel(addLabel: 'Name',),
                   CustomTextField(addHintText: 'Johnsmith',
                  controller: nameController,

                  ), //Name
                 const TextFieldLabel(addLabel: 'Phone Number',),
                 PhoneNumberTextField(controller: phoneController,),//Phone Number
                 const TextFieldLabel(addLabel: 'Email ID',),
                  CustomTextField(addHintText: 'johnsmith1323@gmail.com', controller: emailController,), //Email

                 const SizedBox(height: 18,),

                 Center(
                   child: GestureDetector(
                     onTap: (){
                       if(nameController.text.isNotEmpty){
                         print('namt can\'t be empty');
                       }else if(nameController.text.isNotEmpty){

                       }else if(nameController.text.isNotEmpty){

                       }else {
                         // Loder will start
                         _registrationCont.registration(
                         name: nameController.text,
                         email: emailController.text,
                         phone: phoneController.text
                        ).then((value) {
                          //loder will close
                         });
                       }

                     },
                     child: Container(
                       child:
                       Center(
                         child: Text(
                           'Register',
                           style: GoogleFonts.poppins(
                               color: Colors.white,
                               fontWeight: FontWeight.w600,
                               fontSize: 24
                           ),
                         ),),
                       height: 70.0,
                       width: MediaQuery.of(context).size.width - 180.0,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           //color: Colors.blue,
                           image: const DecorationImage(
                               image:  AssetImage(
                                   'assets/btn.png'
                               ),
                               fit: BoxFit.cover
                           )
                       ),
                     ),
                   ),
                 ),
                const SizedBox(height: 8,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       "Already have an account?",
                       style: GoogleFonts.poppins(
                         color: Colors.white,
                         fontWeight: FontWeight.w300,
                         fontSize: 12,
                       ),
                     ),
                     Text(
                       "Login",
                       style: GoogleFonts.poppins(
                         color: highLightColor,
                         fontWeight: FontWeight.w300,
                         fontSize: 12,
                       ),

                     ),
                   ],
                 )


               ],
             ),
           ),
         ),


    );
  }
  


}
