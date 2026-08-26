import 'package:flutter/material.dart';


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CookpadHomeScreen(),
    );
  }
}

class CookpadHomeScreen extends StatelessWidget {
  const CookpadHomeScreen({super.key});

  // Data dummy untuk grid "Pencarian Populer"
  final List<Map<String, String>> popularSearches = const [
    {
      'title': 'ayam bakar',
      'image': 'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?q=80&w=400',
    },
    {
      'title': 'bolu pisang\nkukus takaran\nsendok',
      'image': 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?q=80&w=400',
    },
    {
      'title': 'capcay',
      'image': 'https://images.unsplash.com/photo-1540420773420-3366772f4999?q=80&w=400',
    },
    {
      'title': 'bolu pisang',
      'image': 'https://images.unsplash.com/photo-1603532648955-039310d9ed75?q=80&w=400',
    },
    {
      'title': 'soto ayam',
      'image': 'https://images.unsplash.com/photo-1541832676-9b763b0239ab?q=80&w=400',
    },
    {
      'title': 'brownies kukus',
      'image': 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?q=80&w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F5), // Warna background krem muda
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // 1. HEADER (Logo + Profile & Notifikasi)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo & Nama Aplikasi
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe6C0hK4fF4Omo3hyZtxiBLTYCD8dvadAEUNT8WmZDVw&s=10',
                        width: 38,
                        height: 38,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'cookpad',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                // Profil & Lonceng Notifikasi
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=200',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.notifications_none, size: 28, color: Colors.grey[800]),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 2. SEARCH BAR (Ketik bahan-bahan...)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600], size: 22),
                  const SizedBox(width: 10),
                  Text(
                    'Ketik bahan-bahan...',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 3. BANNER PROMO (Aneka Gorengan)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?q=80&w=800',
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            // 4. JUDUL SECTION (Pencarian Populer)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  'Pencarian Populer',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Diperbarui 04.30',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // 5. GRID MENU Makanan (2 Kolom)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.3,
              ),
              itemCount: popularSearches.length,
              itemBuilder: (context, index) {
                final item = popularSearches[index];
                return Stack(
                  children: [
                    // Gambar Makanan
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          item['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Shadow/Gradient Hitam di Atas Gambar Agar Teks Jelas
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Teks Nama Makanan
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Text(
                        item['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}