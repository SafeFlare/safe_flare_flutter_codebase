import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_flare/firebase.dart';
import 'package:safe_flare/widgets/toast.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  const SignUp({super.key, required this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _verifpassword = TextEditingController();

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
              const SizedBox(
                height: 20,
              ),     
              TextField(
                controller: _name,
                decoration: InputDecoration( 
                  hintText: "Full Name",
                ),
              ),                 
              const SizedBox(
                height: 10,
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
                controller: _password,
                obscureText: true,
                decoration: InputDecoration( 
                  hintText: "Password",
                ),
              ),                 
              const SizedBox(
                height: 10,
              ),     
              TextField(
                controller: _verifpassword,
                obscureText: true,
                decoration: InputDecoration( 
                  hintText: "Verify password",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () async {
                if(await _signUp()) {
                  widget.toggleView("homepage");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  const Color(0xffdf826c),
                fixedSize:  const Size(150,20)
              ), 
              child: const Text("Sign Up", style: TextStyle(color: Colors.white),)),   
              const SizedBox(
                height: 20,
              ),                
              RichText(
                text: TextSpan(
                  text: 'Already registered? ',
                  style: const TextStyle(color: Colors.black),
                  children: [ 
                    TextSpan( 
                      text: 'Login here',
                      style: const TextStyle(color: Color(0xffdf826c), fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        widget.toggleView("login");
                      },
                    )
                  ]
                ),
                
              )                                                                            
              
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xfff8ffd2),
    );
  }

  Future<bool> _signUp() async {
    String email = _email.text;
    String password = _password.text;
    String verify_password = _verifpassword.text;
    String username = _name.text;
    if(password == verify_password) {
      User? user = await _auth.signUpWithEmailAndPassword(
          username, email, password);

      if (user != null) {
        showToast(message: "User is successfully register");
        return true;
      } else {
        showToast(message: "User failed to register");
        return false;
      }
    } else {
      showToast(message: "Password Not Match");
      return false;
    }
  }

}