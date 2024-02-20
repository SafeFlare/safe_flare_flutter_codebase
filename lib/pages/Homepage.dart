// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:safe_flare/widgets/Home.dart';
import 'package:safe_flare/widgets/Maps.dart';
import 'package:safe_flare/widgets/Profile.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  int _currentIndex = 0;

  var content = [
    const Home(),
    const Maps(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Image(
              image: AssetImage("assets/images/logononcut.png"),
            )),
        title: const Text("SafeFlare",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0xffd0f288),
        actions: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications), // Ikon notifikasi
                onPressed: () {
                  // Logika yang akan dijalankan saat tombol ditekan
                },
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: const Center(
                    child: Text(
                      '5', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      // content here
      body: content[_currentIndex],
      // endcontent

      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Maps",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: "Profil",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xffd0f288),
      ),
    );
  }

}
