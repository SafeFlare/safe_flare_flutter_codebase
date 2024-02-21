import 'package:flutter/material.dart';
import 'package:safe_flare/pages/SignIn.dart';
import 'package:safe_flare/pages/SignUp.dart';
import 'package:safe_flare/pages/Homepage.dart';
import 'package:safe_flare/firebase.dart';

class AuthenticateSignInFirst extends StatefulWidget {
  const AuthenticateSignInFirst({super.key});

  @override
  State<AuthenticateSignInFirst> createState() => _AuthenticateSignInFirstState();
}

class _AuthenticateSignInFirstState extends State<AuthenticateSignInFirst> {
  String showSignIn = "login";
  final FirebaseAuthService _auth = FirebaseAuthService();
  void toggleView(String page) {
    setState(() {
      showSignIn = page;
    });
  }

  Future<bool> checkLogin() async {
    return await _auth.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLogin(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Handle loading state
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error state
          return Text('Error: ${snapshot.error}');
        } else {
          bool isLoggedIn = snapshot.data ?? false;

          if (showSignIn == "login" && !isLoggedIn) {
            return SignIn(toggleView: toggleView);
          } else if (showSignIn == "register") {
            return SignUp(toggleView: toggleView);
          } else {
            return Homepage();
          }
        }
      },
    );
  }
}