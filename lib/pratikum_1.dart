import 'package:flutter/material.dart';

void main() {
  runApp(const Pratikum());
}

class Pratikum extends StatelessWidget {
  const Pratikum({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Pratikum 1'), backgroundColor: Colors.red),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                right: 20,
                left: 20,
                top: 40,
                bottom: 40,
              ),
              color: const Color.fromARGB(255, 233, 233, 233),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        "BERITA TERKINI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                      )
                    )
                  ),
                  Container(
                    child: Text(
                      "PERTANDINGAN HARI INI",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )
                    )
                  )
                ]
              )
            ),


            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 194, 40, 40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.network(
                    'https://thumb.viva.co.id/media/frontend/thumbs3/2026/07/16/6a58e57c86def-timnas-voli-putra-indonesia-mengalahkan-kamboja-3-0-di-laga-perdana-pool-a-sea-v-league-2026_gemini_1265_711.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    color: Colors.white,
                    child: Text(
                      "Hasil Sea V League 2026: Timnas Voli Putra Indonesia Kalahkan Kamboja 3-0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: const Color.fromARGB(255, 241, 54, 54),
                    child: Text(
                      'Transfer',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 15, 15, 15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzbwn-QcZR43mg8bSMuJrHYpA5u2ERyd8AmHezKClorx-jZlR_EioFnr0&s=100',
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Rekor Terburuk RRQ Hoshi di MPL ID S17, Awal Musim Jadi Sorotan',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: const Color.fromARGB(166, 133, 132, 132),
                        ),
                      ),
                    ),
                    child: const Text(
                      'RRQ 9 April 2026',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 15, 15, 15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzbwn-QcZR43mg8bSMuJrHYpA5u2ERyd8AmHezKClorx-jZlR_EioFnr0&s=100',
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Rekor Terburuk RRQ Hoshi di MPL ID S17, Awal Musim Jadi Sorotan',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: const Color.fromARGB(166, 133, 132, 132),
                        ),
                      ),
                    ),
                    child: const Text(
                      'RRQ 9 April 2026',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
