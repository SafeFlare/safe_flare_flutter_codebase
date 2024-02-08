import 'package:flutter/material.dart';
import 'package:safe_flare/pages/homepage.dart';

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(padding: EdgeInsets.fromLTRB(10,10,0,10),
            child: Image(image: AssetImage("assets/images/logononcut.png"),)),
          title: Text("SafeFlare",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
          backgroundColor: Color(0xfff8ffd2),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/forest_illustration.png"),),
              SizedBox(height: 20,),
              Text("Halo Masyarakat!",
                 style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )
              ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.fromLTRB(40,0,40,0),
                child: 
                Text("Menanggapi adanya keresahan kebakaran hutan dan lahan yang dilakukan oleh orang yang tak bertanggung jawab kami berinisiatif untuk ikut membantu dalam pemantauan kebakaran hutan dan lahan baik terbakar secara disengaja atau tidak disengaja. Mari bergabung dengan kami untuk bersama sama memantau hutan dan lahan dibumi kita tercinta.",
                textAlign: TextAlign.center,
                 style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                )
              ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return Homepage();
                  })
                );
              }, 
              child: Text("Masuk", style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffdf826c),
                fixedSize: Size(150,20)
              )),
              OutlinedButton(onPressed: () {

              }, child: Text("Daftar", style: TextStyle(color: Colors.black),),
              style: OutlinedButton.styleFrom(
                fixedSize: Size(150,20)
              ),
              )
            ],
          )
          ),
        backgroundColor: Color(0xfff8ffd2),
      );
  }
}