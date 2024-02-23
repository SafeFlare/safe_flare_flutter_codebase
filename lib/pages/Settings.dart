import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _enableFeature = false; // Initial value for the checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Settings', style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0xffd0f288),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Settings:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Enable Notification'),
              trailing: Checkbox(
                value: _enableFeature,
                onChanged: (value) {
                  setState(() {
                    _enableFeature = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
