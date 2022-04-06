import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

 GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount? get user => _user!;

  Future googleLogin() async {
  final  googleUser =  await googleSignIn.signIn();
  if(googleUser == null) return;
  _user = googleUser;


  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken:  googleAuth.accessToken,
    idToken:  googleAuth.idToken,
   );

  await FirebaseAuth.instance.signInWithCredential(credential);

  if(FirebaseAuth.instance.currentUser != null){
    print('google authentication successful');
    print('${FirebaseAuth.instance.currentUser?.displayName}  signed in.');
 }
  else {
    print('unable in sign in ');
  }
}
