import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffd0f288),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(45.0),
                  bottomRight: Radius.circular(45.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.0),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/profile_picture.jpg'),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Nama Anda',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Email Anda',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 5.0,
              right: 5.0,
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Color(0xFF8ADAB2),
                ),
                child: const Icon(
                  Icons.live_help,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          // Set lebar Container menjadi sepanjang layar
          padding: const EdgeInsets.all(16.0),
          // Atur padding sesuai kebutuhan
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ElevatedButton(
              onPressed: () {
                // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
              },
              child: const Text('Account'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
              },
              child: const Text('App Setting'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
              },
              child: const Text('Add Device'),
            ),
            ElevatedButton(
              onPressed: () {
                // Tambahkan fungsi yang akan dijalankan saat tombol ditekan
              },
              child: const Text('Feedback'),
            ),
          ]),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Tambahkan fungsi untuk meng-handle logout atau navigasi ke halaman pengaturan
          },
          child: const Text('Logout'),
        ),
      ],
    )
    )
    );
  }
}