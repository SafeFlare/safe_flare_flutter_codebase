import 'package:flutter/material.dart';
import 'package:safe_flare/widgets/InpDec.dart';

class InputReport extends StatefulWidget {
  const InputReport({super.key});

  @override
  State<InputReport> createState() => _InputReportState();
}

class _InputReportState extends State<InputReport> {
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
      body: Center( 
        child: Form(child: 
          Padding(
            padding: EdgeInsets.all(20),
            child: Column( 
              children: [ 
                Image(
                  image: AssetImage("assets/images/insert_image.png"),
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                ElevatedButton(onPressed: () {
                  
                  }, 
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffdf826c),
                      fixedSize: Size(MediaQuery.of(context).size.width, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  child: const Text("Take a picture", style: TextStyle(color: Colors.white),),

                ),
                SizedBox(height: 20,),
                TextFormField(decoration: inpDec.copyWith(hintText: 'Report name')),
                SizedBox(height: 20,),
                TextFormField(decoration: inpDec.copyWith(hintText: 'Location')),
                SizedBox(height: 20,),
                Row( 
                  children: [ 
                    ElevatedButton(onPressed: () {
                      
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
                    ElevatedButton(onPressed: () {
                      
                      }, 
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffdf826c),
                          fixedSize: Size(MediaQuery.of(context).size.width * 0.45, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                        ),
                      child: const Text("Use current location", style: TextStyle(color: Colors.white), maxLines: 1,),

                    ),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  
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
    );
  }
}