import 'package:flutter/material.dart';
import 'package:safe_flare/widgets/InpDec.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:safe_flare/widgets/toast.dart';

class AddDevice extends StatefulWidget {
  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  Position? _currentPosition;
  double? saveLatitude;
  double? saveLongitude;
  int _numberOfPoints = 0;
  String address = "null";
  String autocompletePlace = "null";
  TextEditingController _deviceIdController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Device', style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0xffd0f288),
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Number of Points:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _numberOfPoints = int.tryParse(value) ?? 0;
                  });
                },
                decoration: inpDec.copyWith(hintText: 'Enter amount of points here'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Device ID:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: _deviceIdController,
                decoration: inpDec.copyWith(hintText: 'Enter your desired device id here'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Location:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _locationController,
                decoration: inpDec.copyWith(hintText: 'Open location picker'),
              ),
              const SizedBox(height: 20),
              Row( 
                children: [ 
                  ElevatedButton(
                    onPressed: _getCurrentPosition,
                    child: const Text('Use current location', maxLines: 1, style: TextStyle( 
                      color: Colors.white
                    ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffdf826c),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.45, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      // Get current location
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlacePicker(
                                apiKey: 'AIzaSyCb6frJQNMU4MdfXeYZtwkYrUa4gq00F-M',
                                onPlacePicked: (result) { 
                                  print(result.formattedAddress); 
                                  print(result.addressComponents);
                                  _getCoordFromLocation(result.formattedAddress!);
                                  _locationController.text = result.formattedAddress ?? "";
                                  Navigator.of(context).pop();
                                },
                                initialPosition: const LatLng(29.146727, 76.464895),
                                useCurrentLocation: true,
                                resizeToAvoidBottomInset: false, // only works in page mode, less flickery, remove if wrong offsets
                              ),
                            ),
                          );
                    },
                    child: const Text('Location picker', maxLines: 1, style: TextStyle( 
                      color: Colors.white
                    ),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffdf826c),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.45, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    
                  ),
                ],
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Process the data, e.g., save it to a database
                  print('Number of Points: $_numberOfPoints');
                  print('Device ID: ${_deviceIdController.text}');
                  // print('Latitude: ${_latitudeController.text}');
                  // print('Longitude: ${_longitudeController.text}');
                },
                child: const Text('Add Device', style: TextStyle(color: Colors.black), maxLines: 1,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffd0f288),
                  fixedSize: Size(MediaQuery.of(context).size.width, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => {_currentPosition = position,
        _getAddressFromLatLng(position)
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

Future<void> _getAddressFromLatLng(Position position) async {
  await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude)
      .then((List<Placemark> placemarks) {
    setState(() {
      saveLatitude = _currentPosition!.latitude;
      saveLongitude = _currentPosition!.longitude;
    });
    Placemark place = placemarks[0];
    _locationController.text = '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  }).catchError((e) {
    debugPrint(e);
  });
 }


  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location services are disabled. Please enable the services')));
      showToast(message: 'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {   
        showToast(message: 'Location permissions are denied');
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showToast(message: 'Location permissions are permanently denied, we cannot request permissions.');
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCoordFromLocation(String location) async
  {
    List<geo.Location> addresses = await 
    locationFromAddress(location);

    var place = addresses.first;
    setState(() {
      saveLatitude = place.latitude;
      saveLongitude = place.longitude;
    });
    print(place.latitude);
    print(place.longitude);
  }
}
