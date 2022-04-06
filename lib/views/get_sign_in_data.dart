import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical/views/home.dart';

class GetSignInData extends StatefulWidget {
  @override
  _GetSignInDataState createState() => _GetSignInDataState();
}

class _GetSignInDataState extends State<GetSignInData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasData){
            return Home();
          }

          else if (snapshot.hasError){
            return Center(child: Text('something went wrong'),);

          }
          else {
            return GetUserData() ;
          }
        },
      ),

    );
  }
}

class GetUserData extends StatefulWidget {
  @override
  _GetUserDataState createState() => _GetUserDataState();
}

class _GetUserDataState extends State<GetUserData> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.photoURL!),
          )
        ],
      ),
    );
  }
}

