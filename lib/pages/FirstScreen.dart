// ignore: file_names
import 'package:flutter/material.dart';
import 'package:safe_flare/pages/AuthenticateSignInFirst.dart';
import 'package:safe_flare/pages/AuthenticateSignUpFirst.dart';
import 'package:safe_flare/pages/Homepage.dart';
import 'package:safe_flare/firebase.dart';

class FirstScreen extends StatelessWidget {
  final FirebaseAuthService _auth = FirebaseAuthService();
  Future<bool> checkLogin() async {
    return await _auth.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: checkLogin(),
    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
    bool isLoggedIn = snapshot.data ?? false;
    if(!isLoggedIn) {
      return Scaffold(
        appBar: AppBar(
          leading: const Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Image(image: AssetImage("assets/images/logononcut.png"),)),
          title: const Text("SafeFlare",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color(0xfff8ffd2),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/forest_illustration.png"),),
                const SizedBox(height: 20,),
                const Text("Hello People!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                ),
                const SizedBox(height: 20,),
                const Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child:
                  Text(
                      "Responding to the risks of forest and land fires carried out by irresponsible people, we took the initiative to help in monitoring forest and land fires wether they were intentionally or unintentionally burned. Let's join us in our quest to monitor the forest and land in our beloved earth.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      )
                  ),
                ),
                const SizedBox(height: 40,),
                ElevatedButton(onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return AuthenticateSignInFirst();
                      })
                  );
                },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffdf826c),
                        fixedSize: const Size(150, 20)
                    ),
                    child: const Text(
                      "Login", style: TextStyle(color: Colors.white),)
                ),
                OutlinedButton(onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const AuthenticateSignUpFirst();
                      })
                  );
                },
                  style: OutlinedButton.styleFrom(
                      fixedSize: const Size(150, 20)
                  ),
                  child: const Text(
                    "Sign Up", style: TextStyle(color: Colors.black),),
                )
              ],
            )
        ),
        backgroundColor: const Color(0xfff8ffd2),
      );
    } else {
      return Homepage();
    }
    });
  }
}