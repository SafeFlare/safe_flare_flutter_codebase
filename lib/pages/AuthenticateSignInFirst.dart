import 'package:flutter/material.dart';
import 'package:safe_flare/pages/SignIn.dart';
import 'package:safe_flare/pages/SignUp.dart';

class AuthenticateSignInFirst extends StatefulWidget {
  const AuthenticateSignInFirst({super.key});

  @override
  State<AuthenticateSignInFirst> createState() => _AuthenticateSignInFirstState();
}

class _AuthenticateSignInFirstState extends State<AuthenticateSignInFirst> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}