import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final List<String> notifications = List.generate(50, (index) => 'Notifikasi ke-${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text(notifications[index]),
            subtitle: Text('Detail notifikasi di sini...'), // Anda bisa mengubah ini sesuai dengan konten notifikasi yang sebenarnya
            onTap: () {
              // Logika untuk menangani ketika notifikasi ditekan
              print('Notifikasi ${notifications[index]} ditekan!');
            },
          );
        },
      ),
    );
  }
}
