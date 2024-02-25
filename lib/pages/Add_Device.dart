import 'dart:io';

import 'package:flutter/material.dart';
import 'package:safe_flare/widgets/InpDec.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:safe_flare/widgets/toast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddDevice extends StatefulWidget {
  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  Position? _currentPosition;
  double? saveLatitude;
  double? saveLongitude;
  bool _isButtonDisabled = false;
  String buttonTextCurrentLocation = "Use current location";
  int _numberOfPoints = 0;
  String address = "null";
  String autocompletePlace = "null";
  TextEditingController _deviceIdController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  File ? _selectedImage;

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
                Center(
                  child: _selectedImage != null ? Image.file(_selectedImage!, width: MediaQuery.of(context).size.width * 0.5,) : Image(
                    image: AssetImage("assets/images/insert_image.png"),
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [ 
                    ElevatedButton(onPressed: () {
                        _pickImageFromCamera();
                      }, 
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffdf826c),
                          fixedSize: Size(MediaQuery.of(context).size.width*0.43, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      child: const Text("Camera", style: TextStyle(color: Colors.white),),

                    ),
                    Spacer(),
                    ElevatedButton(onPressed: () {
                        _pickImageFromGallery();
                      }, 
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffdf826c),
                          fixedSize: Size(MediaQuery.of(context).size.width*0.43, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      child: const Text("Gallery", style: TextStyle(color: Colors.white),),

                    ),
                  ],
                ),

                SizedBox(height: 20,),
            
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
                onTap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlacePicker(
                            apiKey: 'AIzaSyCb6frJQNMU4MdfXeYZtwkYrUa4gq00F-M',
                            onPlacePicked: (result) { 
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
                readOnly: true,
              ),
              const SizedBox(height: 20),
              Row( 
                children: [ 
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlacePicker(
                                apiKey: 'AIzaSyCb6frJQNMU4MdfXeYZtwkYrUa4gq00F-M',
                                onPlacePicked: (result) { 
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
                  Spacer(),
                  ElevatedButton(
                    onPressed: _isButtonDisabled ? null : _getCurrentPosition,
                    child: Text(buttonTextCurrentLocation, maxLines: 1, style: TextStyle( 
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
                onPressed: () async {
                  // Process the data, e.g., save it to a database
                  // print('Number of Points: $_numberOfPoints');
                  var response = await http.post(Uri.parse("https://safeflare-jfrbg3xq6a-as.a.run.app/api/reg_device"), body: {
                    "id": _deviceIdController.text,
                    "lat": saveLatitude.toString(),
                    "long": saveLongitude.toString(),
                  });
                  print(response.body);
                  print('Device ID: ${_deviceIdController.text}');
                  print('location :  ${_locationController.text}');
                  print('Latitude: ${saveLatitude}');
                  print('Longitude: ${saveLongitude}');
                  
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

  postData() async {

  }

  Future<void> _getCurrentPosition() async {
    setState(() {
      _isButtonDisabled = true;
      buttonTextCurrentLocation = "Fetching location";
    });
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

Future<void> _getAddressFromLatLng(Position position) async {
  await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude)
      .then((List<Placemark> placemarks) {
    saveLatitude = _currentPosition!.latitude;
    saveLongitude = _currentPosition!.longitude;
    Placemark place = placemarks[0];
    _locationController.text = '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
    setState(() {
      _isButtonDisabled = false;
      buttonTextCurrentLocation = "Use current location";
    });
  }).catchError((e) {
    debugPrint(e);
  });
 }


  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showToast(message: 'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {   
        showToast(message: 'Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showToast(message: 'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  Future<void> _getCoordFromLocation(String location) async
  {
    List<geo.Location> addresses = await 
    locationFromAddress(location);

    var place = addresses.first;
    saveLatitude = place.latitude;
    saveLongitude = place.longitude;
  }

    Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
