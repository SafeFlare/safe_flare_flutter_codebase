import 'package:flutter/material.dart';
import 'package:safe_flare/widgets/InpDec.dart';

class Account extends StatelessWidget {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page', style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0xffd0f288),
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Center( 
                child: Column( 
                  children: [ 
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/profile_picture.png'),
                      child: SizedBox.shrink(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hello, Kamu',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ),
              SizedBox(height: 20),
              Text(
                'Change Profile Name :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox( 
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: inpDec.copyWith(hintText: 'New Name'),
              ),
              SizedBox(height: 20),
              Text(
                'Change Password:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox( 
                height: 20,
              ),
              TextField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: inpDec.copyWith(hintText: 'Old Password'),
              ),
              SizedBox( 
                height: 20,
              ),
              TextField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: inpDec.copyWith(hintText: 'New Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                                // Handle password change logic here
                  String oldPassword = _oldPasswordController.text;
                  String newPassword = _newPasswordController.text;

                  // Implement your logic to change the password
                  // For simplicity, we'll just print the old and new passwords
                  print('Old Password: $oldPassword');
                  print('New Password: $newPassword');
                }, 
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffd0f288),
                    fixedSize: Size(MediaQuery.of(context).size.width, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                child: const Text("Update Profile ", style: TextStyle(color: Colors.black), maxLines: 1, ),

              ),
            ],
          ),
        ),
      )
    );
  }
}
