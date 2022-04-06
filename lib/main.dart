import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical/language/custome_language.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical/services/google_sign_in.dart';

import 'package:medical/views/home.dart';
import 'package:medical/views/login.dart';
import 'package:medical/views/onboarding.dart';
import 'package:medical/views/registration.dart';
import 'package:medical/views/select_profile.dart';
import 'package:medical/views/select_profile_patient.dart';
import 'package:medical/views/splash_screen.dart';
import 'package:medical/views/widget/phonenumber_textfield.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: CustomLanguage(),
      //locale: const Locale('ar', 'SA'),
      locale: const Locale('en', 'US'),

      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Doctor App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SelectProfilePatient(),
    );
  }
}
