import 'package:final01/pages/first_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          //User is logged in
          if(snapshot.hasData){
            return FirstPage();
          }
          //User is Not Logged In
          else{
            return LoginPage();
          }
        }
      ),
    );
  }
}