// ignore_for_file: file_names

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
                  const TextField(
                    decoration: InputDecoration( 
                      hintText: "Email",
                    ),
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
                  child: const Text("Masuk", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffdf826c),
                    fixedSize: const Size(150,20)
                  )),
                  const SizedBox(
                    height: 20,
                  ),                                    
                  ElevatedButton(onPressed: () {widget.toggleView();}, child: const Text("to sign up"))
                ],
              ),
            ),
          ],
        )
      ),
      backgroundColor: const Color(0xfff8ffd2),
    );
  }
}