import 'package:flutter/material.dart';

void main() {
  runApp(const MyMiniCoding());
}

class MyMiniCoding extends StatelessWidget {
  const MyMiniCoding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Coding Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 35, 33, 33),
        fontFamily: 'Roboto',
      ),
      home: const CodingMini(),
    );
  }
}

// Model data untuk Produk
class ProductModel {
  final String id;
  final String name;
  final String originalPrice;
  final String discountPrice;
  final String discountPercent;
  final String imageUrl;
  bool isFavorite;
  bool isInCart;

  ProductModel({
    required this.id,
    required this.name,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountPercent,
    required this.imageUrl,
    this.isFavorite = false,
    this.isInCart = false,
  });
}

class CodingMini extends StatefulWidget {
  const CodingMini({super.key});

  @override
  State<CodingMini> createState() => _CodingMiniState();
}

class _CodingMiniState extends State<CodingMini> {
  // Hitung total item yang ada di keranjang
  int get totalCartItems => products.where((p) => p.isInCart).length;

  // HANYA 2 PRODUK
  List<ProductModel> products = [
    ProductModel(
      id: '1',
      name: 'Sepatu Sneaker',
      originalPrice: 'Rp 150.000',
      discountPrice: 'Rp 75.000',
      discountPercent: '50% OFF',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE2PsxaLC3NXt7QGAxt-ANnLLx-iSR5vdwY7gYug7WrQ&s=10',
    ),
    ProductModel(
      id: '2',
      name: 'Jam Tangan Digital',
      originalPrice: 'Rp 300.000',
      discountPrice: 'Rp 210.000',
      discountPercent: '30% OFF',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXNCs3c59301fvDZWuu-lOsdhsVaAuhi7ZzgVKr-NiiA&s=10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 41, 41),
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFDD8C23)),
          onPressed: () {},
        ),
        title: const Text(
          'Flash Sale 9.9',
          style: TextStyle(
            color: Color(0xFFDD8C23),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Badge(
              alignment: const Alignment(0.4, -0.5),
              label: Text(totalCartItems > 0 ? '$totalCartItems' : ''),
              backgroundColor: totalCartItems > 0
                  ? Colors.red
                  : Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.shopping_cart, color: Color(0xFFDD8C23)),
                iconSize: 24,
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. WIDGET BANNER FLASH SALE (DIKEMBALIKAN)
            _buildFlashSaleBanner(),
            const SizedBox(height: 24),

            // 2. JUDUL SECTION
            const Text(
              'Daftar Produk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // 3. GRID 2 PRODUK
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.60,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductCard(product);
              },
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET BANNER FLASH SALE
  Widget _buildFlashSaleBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(
          0xFFDD8C23,
        ), // disesuaikan dengan tema warna oranye kamu
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -20,
            child: Icon(
              Icons.flash_on,
              size: 140,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.flash_on, color: Colors.white, size: 28),
                  SizedBox(width: 6),
                  Text(
                    'FLASH SALE 9.9',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Berakhir dalam',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  _timerBox('02'),
                  _timerDivider(),
                  _timerBox('15'),
                  _timerDivider(),
                  _timerBox('40'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timerBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _timerDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        ':',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  // WIDGET KARTU PRODUK
  Widget _buildProductCard(ProductModel product) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 50, 48, 48),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  product.imageUrl,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product.discountPercent,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      product.isFavorite = !product.isFavorite;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 16,
                      color: product.isFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  product.originalPrice,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product.discountPrice,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDD8C23),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: product.isInCart
                          ? Colors.green
                          : const Color(0xFFDD8C23),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        product.isInCart = !product.isInCart;
                      });
                    },
                    icon: Icon(
                      product.isInCart ? Icons.check : Icons.add_shopping_cart,
                      size: 14,
                      color: Colors.black,
                    ),
                    label: Text(
                      product.isInCart ? 'Di Keranjang' : 'Beli',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
