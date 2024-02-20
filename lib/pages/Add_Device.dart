import 'package:flutter/material.dart';

class AddDevicePage extends StatefulWidget {
  @override
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  int _numberOfPoints = 0;
  TextEditingController _deviceIdController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Device'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Number of Points:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _numberOfPoints = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Device ID:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _deviceIdController,
            ),
            SizedBox(height: 20),
            Text(
              'Latitude:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _latitudeController,
            ),
            SizedBox(height: 20),
            Text(
              'Longitude:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _longitudeController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Get current location

              },
              child: Text('Get Location'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Process the data, e.g., save it to a database
                print('Number of Points: $_numberOfPoints');
                print('Device ID: ${_deviceIdController.text}');
                print('Latitude: ${_latitudeController.text}');
                print('Longitude: ${_longitudeController.text}');
              },
              child: Text('Add Device'),
            ),
          ],
        ),
      ),
    );
  }
}
