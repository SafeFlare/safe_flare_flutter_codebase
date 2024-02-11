import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  const SignUp({super.key, required this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        Padding(
          padding: const EdgeInsets.fromLTRB(40,0,40,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage("assets/images/logononedited.png"),
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              ElevatedButton(onPressed: () {widget.toggleView();}, child: const Text("to sign in"))
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xfff8ffd2),
    );
  }
}