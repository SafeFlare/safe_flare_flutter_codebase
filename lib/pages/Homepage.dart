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
      "imageURL": "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
    },
    {
      "News": "Berita kebakaran 2",
      "imageURL": "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
    },
    {
      "News": "Berita kebakaran 3",
      "imageURL": "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
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
    builder: (BuildContext context) => 
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(padding: EdgeInsets.fromLTRB(0,20,0,0), 
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {}, 
                      child: 
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                        Image(image: AssetImage("assets/images/clock_logo.png")),
                      ),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfff8ffd2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 100)
                    )),
                    SizedBox(height: 5,),
                    Text("Laporan Terakhir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,),
                  ],
                ),

                SizedBox(width: MediaQuery.of(context).size.width * 0.1,),

                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {}, 
                      child: 
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: 
                        Image(image: AssetImage("assets/images/report_logo.png")),
                      ),
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfff8ffd2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 100)
                    )),
                    SizedBox(height: 5,),
                    Text("Pelaporan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,20,20,0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffd0f288), 
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,20,20,0),
            child: Column(children: [
              Text("Latest news",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,),
            ]),
          ),
          Container(
            height: 200,
            child: 
            ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: news.map((data) {
                return Padding(padding: EdgeInsets.fromLTRB(20,20,20,20),
                  child: 
                    Stack(
                      children: [
                      ClipRRect(borderRadius: BorderRadius.circular(20),
                        child: Image.network(data['imageURL'], ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child:                           
                          Text(data['News'],
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
                          ),
                    ],)
                  ,);
                }).toList(),
              ),
          ),
        ],),
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
    Center(child: Text("Profil"),),
  ];

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
          backgroundColor: Color(0xffd0f288),
        ),
        body: content[_currentIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(currentIndex: _currentIndex, 
        items: [
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
        backgroundColor: Color(0xffd0f288),
        ),
      );
  }

  static Future<void> _goBack() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }
}