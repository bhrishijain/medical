import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical/services/facebook_auth.dart';
import 'package:medical/services/google_sign_in.dart';
import 'package:medical/utilis.dart';
import 'package:medical/views/widget/phonenumber_textfield.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  'Welcome back!',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: 1.0

                  ),
                ),
              ),

              const SizedBox(height: 14,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                child: Text('Phone Number',
                style:  GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.white
                ),
                ),
              ),

              PhoneNumberTextField(controller: TextEditingController(),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                child: Text('Password',
                  style:  GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,),
                child: TextFormField(
                  obscureText: true,
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
                      hintText: '********',
                      hintStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2.0
                      )

                  ),


                ),
              ),

              Align(
                alignment: Alignment.topRight,
                child:  Padding(
                  padding: const EdgeInsets.only(right: 14, bottom: 18),
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      letterSpacing: 1.5
                    ),

                  ),
                ),
              ),

              Center(
                child: Container(
                  child:
                  Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24
                      ),
                    ),),
                  height: 60.0,
                  width: MediaQuery.of(context).size.width - 200.0,
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

              Row(
                children:  [
                  Expanded(
                    child:  Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                         height: 1,
                         color: Colors.white,
                    ),
                  ),
                  Text("OR",
                  style: GoogleFonts.poppins(
                    color: Colors.white
                  ),
                  ),
                  Expanded(
                    child:  Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      height: 1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 12,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children:   [
                GestureDetector(
                  onTap: (){
                    signInWithFacebook();
                  },
                  child: const CircleAvatar(
                     radius: 30.0,
                     foregroundImage: AssetImage('assets/facebook.png'),
                     backgroundImage: AssetImage('assets/facebook.png'),
                     backgroundColor: Colors.transparent,
                   ),
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child: GestureDetector(
                     onTap: () {
                        googleLogin();
                     },
                     child: const CircleAvatar(
                       radius: 30.0,
                       foregroundImage: AssetImage('assets/google.png'),
                       backgroundImage: AssetImage('assets/google.png'),
                       backgroundColor: Colors.transparent,
                     ),
                   ),
                 ),
                 const CircleAvatar(
                   radius: 30.0,
                   foregroundImage: AssetImage('assets/apple.png'),
                   backgroundImage: AssetImage('assets/apple.png'),
                   backgroundColor: Colors.transparent,
                 )
               ],
             ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                    ),
                  ),
                    Text(
                      "Create new one",
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
