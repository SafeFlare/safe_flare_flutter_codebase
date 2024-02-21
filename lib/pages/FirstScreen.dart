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
                const Text("Halo Masyarakat!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                ),
                const SizedBox(height: 20,),
                const Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child:
                  Text(
                      "Menanggapi adanya keresahan kebakaran hutan dan lahan yang dilakukan oleh orang yang tak bertanggung jawab kami berinisiatif untuk ikut membantu dalam pemantauan kebakaran hutan dan lahan baik terbakar secara disengaja atau tidak disengaja. Mari bergabung dengan kami untuk bersama sama memantau hutan dan lahan dibumi kita tercinta.",
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
                      "Masuk", style: TextStyle(color: Colors.white),)
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
                    "Daftar", style: TextStyle(color: Colors.black),),
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