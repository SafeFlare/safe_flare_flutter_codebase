import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late BuildContext context;

  static List<Map<String, dynamic>> news = [
    {
      "News": "Berita kebakaran 1",
      "imageURL":
          "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
    },
    {
      "News": "Berita kebakaran 2",
      "imageURL":
          "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
    },
    {
      "News": "Berita kebakaran 3",
      "imageURL":
          "https://bpba.acehprov.go.id/thumbnail/700x0/media/2024.02/whatsapp_image_2023-12-06_at_1006101.jpeg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Image(
                                image:
                                    AssetImage("assets/images/clock_logo.png")),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfff8ffd2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.4, 100))),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Report history",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Image(
                                image:
                                    AssetImage("assets/images/report_logo.png")),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfff8ffd2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.4, 100))),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Report form",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all( 
                  color: const Color(0xffd0f288),
                  width: 10,
                )
              ),
              child: Container( 
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Row( 
                  children: [ 
                    const Image(
                      height: 30,
                      image: AssetImage('assets/images/noto_fire.png'),
                    ),
                    const SizedBox(width: 10,),
                    const Column( 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        Text(
                          "Total reports today :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "10",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      iconSize: 30,
                      color: const Color(0xffd0f288),
                      icon: const Icon(Icons.add_circle),
                      onPressed: () {
                        // Logika yang akan dijalankan saat tombol ditekan
                      },
                    ),
                  ],
                ),
              ),
            ),          
            
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(children: [
                Text(
                  "Latest news",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ]),
            ),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: news.map((data) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            data['imageURL'],
                          ),
                        ),
                        Positioned(
                            left: 20,
                            bottom: 20,
                            child: Text(
                              data['News'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      )
    ;
  }
}