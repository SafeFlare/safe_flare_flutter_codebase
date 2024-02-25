// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_flare/firebase.dart';
import 'package:safe_flare/widgets/toast.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        SingleChildScrollView(
          child: 
                  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40,0,40,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage("assets/images/logononedited.png"),
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration( 
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () async {
                    if(await _signIn()) {
                      widget.toggleView("homepage");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  const Color(0xffdf826c),
                    fixedSize:  const Size(150,20)
                  ), 
                  child: const Text("Login", style: TextStyle(color: Colors.white),)),
                  const SizedBox(
                    height: 20,
                  ),                                    
                  RichText(
                    text:  TextSpan(
                      text: 'Not registered? ',
                      style: const TextStyle(color: Colors.black),
                      children: [ 
                        TextSpan( 
                          text: 'Register here',
                          style: const TextStyle(color: Color(0xffdf826c), fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            widget.toggleView("register");
                          },
                        )
                      ]
                    ),
                    
                  )
                ],
              ),
            ),
          ],
        )
          ,
        )

      ),
      backgroundColor:  const Color(0xfff8ffd2),
    );
  }

  Future<bool> _signIn() async {
    String email = _email.text;
    String password = _password.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      showToast(message: "User is successfully signed in");
      return true;
    } else {
      showToast(message: "User failed to signed in");
      return false;
    }
  }

}