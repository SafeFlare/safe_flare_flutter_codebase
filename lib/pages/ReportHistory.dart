import 'package:flutter/material.dart';

class ReportHistory extends StatefulWidget {
  const ReportHistory({super.key});

  @override
  State<ReportHistory> createState() => _ReportHistoryState();
}

class _ReportHistoryState extends State<ReportHistory> {

    static List<Map<String, dynamic>> reportHistory = [
    {
      "lokasi": "Lahan Gambut, Tol Indralaya",
      "jam": "13:30 W.I.B",
      "tanggal": "12 Januari 2024"
    },
    {
      "lokasi": "Lahan Gambut, Tol Indralaya",
      "jam": "13:30 W.I.B",
      "tanggal": "12 Januari 2024"
    },
    {
      "lokasi": "Lahan Gambut, Tol Indralaya",
      "jam": "13:30 W.I.B",
      "tanggal": "12 Januari 2024"
    },
        {
      "lokasi": "Lahan Gambut, Tol Indralaya",
      "jam": "13:30 W.I.B",
      "tanggal": "12 Januari 2024"
    },
        {
      "lokasi": "Lahan Gambut, Tol Indralaya",
      "jam": "13:30 W.I.B",
      "tanggal": "12 Januari 2024"
    },
    {
      "lokasi": "Lahan Gambut, Tol Indralaya",
      "jam": "13:30 W.I.B",
      "tanggal": "12 Januari 2024"
    },
    {
      "lokasi": "Lahan Gambut, Tol Indralaya",
      "jam": "13:30 W.I.B",
      "tanggal": "12 Januari 2024"
    },
        {
      "lokasi": "Lahan Gambut, Tol Indralaya",
      "jam": "13:30 W.I.B",
      "tanggal": "12 Januari 2024"
    },
  ];

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
        title: const Text("Report history",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0xffd0f288),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: reportHistory.map((data) {
              return Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['tanggal']),
                  SizedBox(height: 20,), 
                  ListTile( 
                    title: Text(data['lokasi']),
                    subtitle: Text(data['jam']),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: Color(0xfff8ffd2),
                    leading: Icon(Icons.compost),
                    trailing: Icon(Icons.sync),
                  ),
                  SizedBox(height: 20,), 
                ],
              );
            }).toList(),

          ),
        ),
        
      
    );
  }
}