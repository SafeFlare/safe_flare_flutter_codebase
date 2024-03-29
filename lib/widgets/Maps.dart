import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  String _address = "";
  String firelevel = "";
  late BitmapDescriptor markerIcon;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() async {
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/noto_fire.png")
        .then(
      (icon) {
        setState(() {
          this.markerIcon = icon;
        });
      },
    );
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-2.9848887, 104.7324725),
    zoom: 15,
  );



  final List<Map<String, dynamic>> markers = [
    {
      "id": 1,
      "ImgUrl": "https://www.mongabay.co.id/wp-content/uploads/2020/12/Tanah-Peramun6.jpg",
      "Temp": 21.0,
      "Humid": 0.70,
      "Lat": -2.981602189069248, 
      "Long": 104.72962850560135,
      "Wind": "North",
      "RiskLevel": 2,
    },
    {
      "id": 2,
      "ImgUrl": "https://www.mongabay.co.id/wp-content/uploads/2020/12/Tanah-Peramun6.jpg",
      "Temp": 22.0,
      "Humid": 0.70,
      "Lat": -2.981664407505179, 
      "Long": 104.73517345264983,
      "Wind": "North",
      "RiskLevel": 1,
    },
    {
      "id": 3,
      "ImgUrl": "https://www.mongabay.co.id/wp-content/uploads/2020/12/Tanah-Peramun6.jpg",
      "Temp": 23.0,
      "Humid": 0.70,
      "Lat": -2.9866418709714324, 
      "Long": 104.72981541392885,
      "Wind": "North",
      "RiskLevel": 3,
    },
    {
      "id": 4,
      "ImgUrl": "https://www.mongabay.co.id/wp-content/uploads/2020/12/Tanah-Peramun6.jpg",
      "Temp": 24.0,
      "Humid": 0.70,
      "Lat": -2.986766307269193,
      "Long": 104.73635720539052,
      "Wind": "North",
      "RiskLevel": 1,
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: GoogleMap( 
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: _initialCameraPosition,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        markers: markers.map((data) {
            return Marker(
              markerId: MarkerId(data["id"].toString()),
              position: LatLng(data["Lat"]!, data["Long"]!),
              icon: markerIcon ?? BitmapDescriptor.defaultMarker,
              onTap: (){
                print(data["Temp"]);
                _openInfo(context, data["ImgUrl"], data["Temp"], data["Humid"], data["Lat"], data["Long"], data["Wind"], data["RiskLevel"]);
              }
            );
        }).toSet(),
      ),
      floatingActionButton: FloatingActionButton( 
        backgroundColor: const Color(0xffd0f288),
        foregroundColor: Colors.black,
        onPressed: _goBack,
       child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  Future<void> _goBack() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }

  void _openInfo(BuildContext context, String imgurl, double temp, double humid, double lat, double long, String wind, int risklevel) {
    setState(() {
      _address = "Loading location data";
    });
    _getLocation(lat, long).then((val) => setState(() {
          _address = val;
        }));
    showGeneralDialog(
      context: context, 
      pageBuilder:(context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, widget){
        return AlertDialog(
          title: Row( 
            children: [ 
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                icon: const Icon(Icons.cancel)),
              const Spacer(),
            ],
          ),
          content: SizedBox( 
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imgurl,
                  ),
                ),
                const SizedBox(height: 20,),
                Text(_address),
                const SizedBox(height: 20,),
                Row( 
                  children: [ 
                    const Image(
                      width: 20,
                      image: AssetImage("assets/images/temp_icon.png")
                    ),
                    const SizedBox(width: 5,),
                    const Text("Temperatures :", textAlign: TextAlign.start,
                      style: TextStyle( 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Spacer(),
                    Text(temp.toString())
                  ],
                ),
                const SizedBox(height: 20,),
                Row( 
                  children: [ 
                    const Image(
                      width: 20,
                      image: AssetImage("assets/images/humid_icon.png")
                    ),
                    const SizedBox(width: 5,),
                    const Text("Humidity :", textAlign: TextAlign.start,
                      style: TextStyle( 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Spacer(),
                    Text((humid * 100).toString()+"%")
                  ],
                ),
                const SizedBox(height: 20,),
                Row( 
                  children: [ 
                    const Image(
                      width: 20,
                      image: AssetImage("assets/images/wind_dir_icon.png")
                    ),
                    const SizedBox(width: 5,),
                    const Text("Wind direction : ", textAlign: TextAlign.start,
                      style: TextStyle( 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Spacer(),
                    Text(wind)
                  ],
                ),
                const SizedBox(height: 20,),
                Row( 
                  children: [
                    const Image(
                      width: 40,
                      image: AssetImage("assets/images/fire_safety_level.png")
                    ),
                    const SizedBox(width: 10,),
                    if(risklevel == 1) 
                      const Text("No risk of wildfire", style: TextStyle( 
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                        ),
                      )
                    else if (risklevel == 2)
                      const Text("Medium risk of wildfire", style: TextStyle( 
                          fontWeight: FontWeight.bold,
                          color: Colors.orange
                        ),
                      )
                    else 
                      const Text("High risk of wildfire", style: TextStyle( 
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      )
                  ],
                )
              ],
            ),
          ),
          shape: OutlineInputBorder( 
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none
          ),
        );
      }
    );
  }

  Future<String> _getLocation(double lat, double long) async
{
  List<Placemark> addresses = await 
  placemarkFromCoordinates(lat, long);

  var place = addresses.first;
  return '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}';
}
}