import 'package:flutter/material.dart';

void main() {
  runApp(const Halamanlogin());
}

class Halamanlogin extends StatelessWidget {
  const Halamanlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 100, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "GymBro",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Image.asset('Asset/GymBro.png', height: 400, width: 300),

                  // 1. Jarak 50px dari gambar ke tombol
                  const SizedBox(height: 50),

                  // 2. Column penampung 2 tombol
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      children: <Widget>[
                        // Tombol Login (Kotak)
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Aksi tombol Login
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .zero, // Membuat sudut siku-siku/kotak
                              ),
                            ),
                            child: const Text(
                              'Create a new account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // Jarak antar tombol
                        const SizedBox(height: 15),

                        // Tombol Sign Up (Kotak dengan garis tepi/Outlined)
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Aksi tombol Sign Up
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius
                                    .zero, // Membuat sudut siku-siku/kotak
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Container(
                          child: Text(
                            'Need help signing in?',
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ),
                      ],
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
