import 'package:flutter/material.dart';

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
              padding: EdgeInsets.fromLTRB(40,0,40,0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/logononedited.png"),
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  TextField(
                    decoration: InputDecoration( 
                      hintText: "Email",
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration( 
                      hintText: "Password",
                    ),
                  ),
                  ElevatedButton(onPressed: () {widget.toggleView();}, child: Text("to sign up"))
                ],
              ),
            ),
          ],
        )
      ),
      backgroundColor: Color(0xfff8ffd2),
    );
  }
}