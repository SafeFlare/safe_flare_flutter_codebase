import 'package:flutter/material.dart';
import 'package:safe_flare/pages/SignIn.dart';
import 'package:safe_flare/pages/SignUp.dart';

class AuthenticateSignUpFirst extends StatefulWidget {
  const AuthenticateSignUpFirst({super.key});

  @override
  State<AuthenticateSignUpFirst> createState() => _AuthenticateSignUpFirstState();
}

class _AuthenticateSignUpFirstState extends State<AuthenticateSignUpFirst> {
  bool showSignUp = true;
  void toggleView() {
    setState(() {
      showSignUp = !showSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignUp) {
      return SignUp(toggleView: toggleView);
    } else {
      return SignIn(toggleView: toggleView);
    }
  }
}