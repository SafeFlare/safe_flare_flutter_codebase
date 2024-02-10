import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  int _currentIndex = 0;

  late BuildContext context;

  static List<Map<String, dynamic>> news = [
    {
      "News": "Berita kebakaran 1",
      "imageURL":
          "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
    },
    {
      "News": "Berita kebakaran 2",
      "imageURL":
          "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
    },
    {
      "News": "Berita kebakaran 3",
      "imageURL":
          "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
    },
  ];

  static Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  var content = [
    Builder(
      builder: (BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Image(
                              image:
                                  AssetImage("assets/images/clock_logo.png")),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff8ffd2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.4, 100))),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Laporan Terakhir",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Image(
                              image:
                                  AssetImage("assets/images/report_logo.png")),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff8ffd2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.4, 100))),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Pelaporan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffd0f288),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(children: [
              Text(
                "Latest news",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ]),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: news.map((data) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          data['imageURL'],
                        ),
                      ),
                      Positioned(
                          left: 20,
                          bottom: 20,
                          child: Text(
                            data['News'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ),
    Builder(builder: (BuildContext context) => 
      Scaffold( 
          body: GoogleMap( 
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: _initialCameraPosition,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
          ),
          floatingActionButton: FloatingActionButton( 
            backgroundColor: Color(0xffd0f288),
            foregroundColor: Colors.black,
            onPressed: _goBack,
            child: const Icon(Icons.center_focus_strong),
          ),
        ),
    ),
    Center(
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
    ),
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
                icon: Icon(Icons.notifications), // Ikon notifikasi
                onPressed: () {
                  // Logika yang akan dijalankan saat tombol ditekan
                },
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Center(
                    child: Text(
                      '5', // Angka notifikasi (ganti sesuai kebutuhan)
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
      body: content[_currentIndex],
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

  static Future<void> _goBack() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }
}
