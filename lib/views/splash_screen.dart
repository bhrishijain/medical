import 'dart:async';


import 'package:flutter/material.dart';
import 'package:medical/views/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/select_profile_services.dart';
import 'home.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>{

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    print('checkFirstSeen');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  Home()));
    } else {
      Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) =>  OnBoardingScreens()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
                image: AssetImage(
                    'assets/bg-1.png',
                )
            )
        ),
        child: Center(

           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Image.asset(

                   'assets/logo.png',
                 height: 300,
                 width: 300,
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 90),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: const [
                     Text('Doctor',
                     style: TextStyle(
                       fontSize: 40,
                       fontWeight: FontWeight.w700,
                       color: Colors.white
                     ),

                     ),
                      SizedBox(width: 12,),
                     Text('App',
                       style: TextStyle(
                           fontSize: 40,
                           fontWeight: FontWeight.w300,
                           color: Colors.white
                       ),

                     )
                   ],
                 ),
               )
             ],
           ),
        ),
      ),
    );
  }


}
