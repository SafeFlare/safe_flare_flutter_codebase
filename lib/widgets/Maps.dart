import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

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



  static List<Map<String, dynamic>> markers = [
    {
      "Lat": -2.981602189069248, 
      "Long": 104.72962850560135
    },
    {
      "Lat": -2.981664407505179, 
      "Long": 104.73517345264983
    },
    {
      "Lat": -2.9866418709714324, 
      "Long": 104.72981541392885
    },
    {
      "Lat": -2.986766307269193,
      "Long": 104.73635720539052
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
        myLocationButtonEnabled: false,
        markers: markers.map((data) {
            return Marker(
              markerId: const MarkerId("Tes tempat"),
              position: LatLng(data["Lat"]!, data["Long"]!),
              icon: markerIcon ?? BitmapDescriptor.defaultMarker
            );
        }).toSet()..add(
          const Marker(
              markerId: MarkerId("Tes tempat"),
              position: LatLng(-2.9848887, 104.7324725),
              icon: BitmapDescriptor.defaultMarker
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton( 
        backgroundColor: Color(0xffd0f288),
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
}