import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

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