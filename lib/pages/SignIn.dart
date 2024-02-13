// ignore_for_file: file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:safe_flare/pages/Homepage.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
                  const TextField(
                    decoration: InputDecoration( 
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration( 
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return Homepage();
                      })
                    );
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
                            widget.toggleView();
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
      ),
      backgroundColor:  const Color(0xfff8ffd2),
    );
  }
}