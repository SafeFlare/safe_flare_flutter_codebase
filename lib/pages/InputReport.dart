import 'dart:io';

import 'package:flutter/material.dart';
import 'package:safe_flare/widgets/InpDec.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:safe_flare/widgets/toast.dart';
import 'package:image_picker/image_picker.dart';

class InputReport extends StatefulWidget {
  const InputReport({super.key});

  @override
  State<InputReport> createState() => _InputReportState();
}

class _InputReportState extends State<InputReport> {
  Position? _currentPosition;
  double? saveLatitude;
  double? saveLongitude;
  bool _isButtonDisabled = false;
  String buttonTextCurrentLocation = "Use current location";
  File ? _selectedImage;

  TextEditingController _locationController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: IconButton(
                icon: const Icon(Icons.arrow_back), // Ikon notifikasi
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
          ),
        title: const Text("Report form",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0xffd0f288),
      ),
      body: 
      SingleChildScrollView( 
        child:       Center( 
        child: Form(child: 
          Padding(
            padding: EdgeInsets.all(20),
            child: Column( 
              children: [ 
                _selectedImage != null ? Image.file(_selectedImage!, width: MediaQuery.of(context).size.width * 0.5,) : Image(
                  image: AssetImage("assets/images/insert_image.png"),
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
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
                TextFormField(decoration: inpDec.copyWith(hintText: 'Reporter name'), controller: _nameController,),
                SizedBox(height: 20,),
                TextFormField(decoration: inpDec.copyWith(hintText: 'Location'), controller: _locationController, 
                readOnly: true,
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
                }
                
                ),
                SizedBox(height: 20,),
                Row( 
                  children: [ 
                    ElevatedButton(onPressed: () {
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffdf826c),
                          fixedSize: Size(MediaQuery.of(context).size.width * 0.43, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      child: const Text("Location picker", style: TextStyle(color: Colors.white),),
                      
                    ),
                    Spacer(),
                    ElevatedButton(onPressed: _isButtonDisabled ? null : _getCurrentPosition, 
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffdf826c),
                          fixedSize: Size(MediaQuery.of(context).size.width * 0.45, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      child: Text(buttonTextCurrentLocation, style: TextStyle(color: Colors.white), maxLines: 1,),

                    ),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                    if(_nameController.text != "" && _locationController.text != "" && saveLatitude != null && saveLongitude != null) {
                      print(_nameController.text);
                      print(_locationController.text);
                      print(saveLatitude);
                      print(saveLongitude);
                    } else {
                      showToast(message: "Data isn't completed");
                    }
                  }, 
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffd0f288),
                      fixedSize: Size(MediaQuery.of(context).size.width, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  child: const Text("Submit ", style: TextStyle(color: Colors.black), maxLines: 1, ),

                ),
              ],
            ),
          )
        )
      ),
      )
    );
  }

  Future<void> _getCoordFromLocation(String location) async
  {
    List<geo.Location> addresses = await 
    locationFromAddress(location);

    var place = addresses.first;

    saveLatitude = place.latitude;
    saveLongitude = place.longitude;
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